import 'package:ace_customer_appoitment_system/core/extensions/context_exts.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomFilledButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onClick;
  final String text;
  final String? disableText;
  final String? loadingText;
  final TextStyle? textStyle;
  final TextStyle? disableTextStyle;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;

  const CustomFilledButton({
    super.key,
    this.isLoading = false,
    required this.onClick,
    required this.text,
    this.disableText,
    this.loadingText,
    this.textStyle,
    this.disableTextStyle,
    this.backgroundColor,
    this.disabledBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? context.colorScheme.primary;
    final disTextStyle =
        disableTextStyle ?? TextStyle(color: bgColor.withValues(alpha: 0.65));
    return FilledButton(
      onPressed: isLoading ? null : onClick,
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.maxFinite, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        disabledBackgroundColor:
            disabledBackgroundColor ?? context.colorScheme.surfaceContainerHigh,
        backgroundColor: bgColor,
      ),
      child: isLoading
          ? Row(
              spacing: 7,
              mainAxisSize: MainAxisSize.min,
              children: [
                LoadingAnimationWidget.horizontalRotatingDots(
                  color: bgColor,
                  size: 23,
                ),
                if (loadingText != null)
                  Text(
                    loadingText!,
                    style: disableTextStyle ?? context.textTheme.titleMedium,
                  ),
              ],
            )
          : onClick == null
          ? Text(disableText ?? text, style: disTextStyle)
          : Text(
              text,
              style:
                  textStyle ?? TextStyle(color: context.colorScheme.onPrimary),
            ),
    );
  }
}
