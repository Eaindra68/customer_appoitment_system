import 'package:ace_customer_appoitment_system/config/colors_constant.dart';
import 'package:ace_customer_appoitment_system/core/extensions/context_exts.dart';
import 'package:flutter/material.dart';

class ContactUsCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? sublabel;

  final VoidCallback onTap;
  const ContactUsCard({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.sublabel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: context.screenWidth,
        height: context.screenWidth / 2.5,
        decoration: context.decoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: ColorConst.primary, size: 30),
              const SizedBox(height: 10),
              Text(label, style: context.textTheme.titleLarge),
              const SizedBox(height: 10),
              Text(sublabel ?? '', style: context.textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
