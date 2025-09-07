import 'dart:io';
import 'package:ace_customer_appoitment_system/config/colors_constant.dart';
import 'package:ace_customer_appoitment_system/core/extensions/context_exts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../config/ui_constant.dart';
import '../../core/constants/my_icons.dart';

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
    final now = DateTime.now();

    final firstDate = DateTime(1900);
    final lastDate = now.add(const Duration(days: 365 * 100));
    final initialDate = selectedDate ?? now;

    final child = GestureDetector(
      onTap: () async {
        if (Platform.isIOS) {
          await showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              DateTime tempSelectedDate = initialDate;
              return Container(
                height: 310,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: initialDate,
                        minimumDate: firstDate,
                        maximumDate: lastDate,
                        onDateTimeChanged: (DateTime dateTime) {
                          tempSelectedDate = dateTime;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoButton(
                          child: const Text("Cancel"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        CupertinoButton(
                          child: const Text("Done"),
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
            initialDate: initialDate,
            firstDate: firstDate,
            lastDate: lastDate,
          );
          onDateChanged?.call(value);
        }
      },
      child: Padding(
        padding: padding ?? const EdgeInsets.fromLTRB(0, 10, 0, 20),
        child: Container(
          width: context.screenWidth,
          padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            border: Border.all(color: ColorConst.labelCol),
          ),
          child: Row(
            children: [
              Text(
                selectedDate == null
                    ? label
                    : UIConstants.dateFormat.format(selectedDate!),
                style: context.textTheme.bodyMedium,
              ),
              const Spacer(),
              SvgPicture.asset(
                MyIcons.calendarSvg,
                colorFilter: const ColorFilter.mode(
                  ColorConst.labelCol,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (isDisabled) return IgnorePointer(ignoring: true, child: child);
    return child;
  }
}
