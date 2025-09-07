import 'package:ace_customer_appoitment_system/core/extensions/context_exts.dart';
import 'package:flutter/material.dart';

import '../../config/colors_constant.dart';
import '../widgets/birthday_selector_card.dart';
import '../widgets/gender_selector_card.dart';

class CustomerInfoPage extends StatefulWidget {
  const CustomerInfoPage({super.key});

  @override
  State<CustomerInfoPage> createState() => _CustomerInfoPageState();
}

class _CustomerInfoPageState extends State<CustomerInfoPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  DateTime? _selectedDateOfBirth;
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
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
          "Customer Information",
          style: context.textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: BoxBorder.all(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Name",
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: "Phone",
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            const SizedBox(height: 20),
            GenderSelector(
              selectedGender: _selectedGender,
              onChanged: (value) {
                _selectedGender = value;
                if (mounted) setState(() {});
              },
              isDisabled: false,
            ),
            BirthDateSelectorCard(
              label: "Date of Birth",
              selectedDate: _selectedDateOfBirth,
              onDateChanged: (value) {
                _selectedDateOfBirth = value;
                if (mounted) setState(() {});
              },
            ),
            BirthDateSelectorCard(
              label: "Appointment Date",
              selectedDate: _selectedDateOfBirth,
              onDateChanged: (value) {
                _selectedDateOfBirth = value;
                if (mounted) setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
