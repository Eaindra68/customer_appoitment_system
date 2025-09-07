import 'dart:typed_data';

import 'package:ace_customer_appoitment_system/config/colors_constant.dart';
import 'package:ace_customer_appoitment_system/core/extensions/context_exts.dart';
import 'package:ace_customer_appoitment_system/presentation/pages/customer_list_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  late Box customersBox;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<dynamic>> _appointmentEvents = {};

  @override
  void initState() {
    super.initState();
    customersBox = Hive.box('customersBox');
    _loadAppointments();
    _selectedDay = _focusedDay;
  }

  void _loadAppointments() {
    final customers = customersBox.values.toList();
    _appointmentEvents = {};

    for (var customer in customers) {
      if (customer['appointmentDate'] != null) {
        try {
          final appointmentDate = DateTime.parse(customer['appointmentDate']);
          final day = DateTime(
            appointmentDate.year,
            appointmentDate.month,
            appointmentDate.day,
          );

          if (_appointmentEvents[day] == null) {
            _appointmentEvents[day] = [];
          }

          _appointmentEvents[day]!.add(customer);
        } catch (e) {
          print('Error parsing date: $e');
        }
      }
    }
    setState(() {});
  }

  List<dynamic> _getAppointmentsForDay(DateTime day) {
    return _appointmentEvents[DateTime(day.year, day.month, day.day)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final firstDate = DateTime(1900);
    final lastDate = now.add(const Duration(days: 365 * 100));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.primary,
        leading: InkWell(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Appointment",
          style: context.textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushWidget(CustomerListPage()),
        shape: const CircleBorder(),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: firstDate,
            lastDay: lastDate,
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            eventLoader: _getAppointmentsForDay,
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: ColorConst.primary,
                shape: BoxShape.circle,
              ),
              markersAlignment: Alignment.bottomCenter,
              markersMaxCount: 3,
              markerSize: 10,
              markerMargin: EdgeInsets.symmetric(horizontal: 1),
              outsideDaysVisible: false,
              markerDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: ColorConst.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              formatButtonTextStyle: TextStyle(color: Colors.white),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
              weekendStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red[700],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(thickness: 1),
          ),
          SizedBox(height: 8),
          Text(
            'Appointments on ${_selectedDay != null ? "${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}" : "Selected Day"}',
            style: context.textTheme.bodyLarge?.copyWith(
              color: ColorConst.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16),
          Expanded(child: _buildAppointmentList()),
        ],
      ),
    );
  }

  Widget _buildAppointmentList() {
    final appointments = _selectedDay != null
        ? _getAppointmentsForDay(_selectedDay!)
        : [];

    if (appointments.isEmpty) {
      return Center(
        child: Text(
          _selectedDay != null
              ? 'No appointments on ${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}'
              : 'Select a date to view appointments',
          style: context.textTheme.labelSmall,
        ),
      );
    }

    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final customer = appointments[index];
        final name = customer['name'] ?? 'Unknown';
        final phone = customer['phone'] ?? 'No phone';
        final address = customer['address'] ?? 'No Address';

        return Padding(
          padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
          child: Container(
            decoration: context.decoration,
            height: 85,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: ColorConst.primary,
                  radius: 24,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name.toString(),
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: address.toString(),
                                style: context.textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          phone.toString(),
                          style: context.textTheme.labelSmall?.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(Icons.phone, color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
