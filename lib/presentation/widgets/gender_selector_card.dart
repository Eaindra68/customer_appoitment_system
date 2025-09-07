import 'package:ace_customer_appoitment_system/config/colors_constant.dart';
import 'package:ace_customer_appoitment_system/core/extensions/context_exts.dart';
import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  final String? selectedGender;
  final void Function(String?)? onChanged;
  final bool isDisabled;

  static const List<String> genders = ['Male', 'Female'];

  const GenderSelector({
    super.key,
    this.selectedGender = 'Male',
    this.onChanged,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Gender", style: context.textTheme.bodyLarge),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: genders.map((gender) {
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<String>(
                    value: gender,
                    groupValue: selectedGender,
                    onChanged: isDisabled ? null : onChanged,
                    activeColor: ColorConst.primary,
                  ),
                  GestureDetector(
                    onTap: isDisabled ? null : () => onChanged?.call(gender),
                    child: Text(
                      gender,
                      style: TextStyle(
                        color: isDisabled ? Colors.grey : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );

    if (isDisabled) return IgnorePointer(ignoring: true, child: child);
    return child;
  }
}
