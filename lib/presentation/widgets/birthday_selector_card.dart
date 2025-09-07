import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BirthDateSelectorCard extends StatelessWidget {
  final String label;
  final DateTime? selectedDate;
  final EdgeInsets? padding;
  final void Function(DateTime?)? onDateChanged;
  final bool isDisabled;

  const BirthDateSelectorCard({
    super.key,
    required this.label,
    this.padding,
    this.selectedDate,
    this.onDateChanged,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();

    final defaultStartDate = currentDate.subtract(
      const Duration(days: 120 * 365),
    );

    final defaultInitialDate = currentDate.subtract(
      const Duration(days: 365 * 25),
    );
    final defaultLastDate = currentDate.subtract(
      const Duration(days: 365 * 10),
    );

    final child = GestureDetector(
      onTap: () async {
        if (Platform.isIOS) {
          await showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              DateTime tempSelectedDate = selectedDate ?? defaultInitialDate;
              return Container(
                height: 310,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: selectedDate ?? defaultInitialDate,
                        minimumDate: defaultStartDate,
                        maximumDate: defaultLastDate,
                        onDateTimeChanged: (DateTime dateTime) {
                          tempSelectedDate = dateTime;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoButton(
                          child: Text("Cancel"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        CupertinoButton(
                          child: Text("Done"),
                          onPressed: () {
                            Navigator.of(context).pop();
                            onDateChanged?.call(tempSelectedDate);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          final value = await showDatePicker(
            context: context,
            initialDate: defaultInitialDate,
            firstDate: defaultStartDate,
            lastDate: defaultLastDate,
          );
          onDateChanged?.call(value);
        }
      },
      child: Padding(
        padding: padding ?? const EdgeInsets.fromLTRB(0, 10, 0, 20),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            suffixIcon: Icon(Icons.calendar_month),
          ),
        ),
      ),
    );

    if (isDisabled) return IgnorePointer(ignoring: true, child: child);
    return child;
  }
}
