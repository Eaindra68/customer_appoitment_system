import 'package:ace_customer_appoitment_system/core/extensions/context_exts.dart';
import 'package:flutter/material.dart';

import '../../config/colors_constant.dart';

class HomeCardWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? sublabel;

  final VoidCallback onTap;
  const HomeCardWidget({
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
        margin: EdgeInsets.symmetric(vertical: 10),
        width: context.screenWidth / 2.5,
        height: context.screenWidth / 2.5,
        color: ColorConst.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 30),
            const SizedBox(height: 10),
            Text(
              label,
              style: context.textTheme.bodyLarge?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              sublabel ?? '',
              style: context.textTheme.bodyLarge?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
