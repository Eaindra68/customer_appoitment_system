import 'package:ace_customer_appoitment_system/core/extensions/context_exts.dart';
import 'package:flutter/material.dart';

import '../../config/colors_constant.dart';

class CustomTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextStyle? style;
  final TextStyle? hintTextStyle;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final bool readOnly;
  final IconData? suffixIcon;
  final IconData? prefixIcon;

  final FocusNode? focusNode;
  final bool isLoading;
  final bool autoFocus;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final BorderRadius? borderRadius;

  const CustomTextfield({
    super.key,
    required this.controller,
    this.hintText,
    this.style,
    this.hintTextStyle,
    this.padding,
    this.contentPadding,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNode,
    this.readOnly = false,
    this.isLoading = false,
    this.autoFocus = false,
    this.onChanged,
    this.onSubmitted,
    this.borderRadius,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.top,
      readOnly: widget.readOnly,
      controller: widget.controller,
      style: context.textTheme.bodyMedium?.copyWith(
        color: ColorConst.fieldtextCol,
      ),
      expands: false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: context.textTheme.bodyMedium?.copyWith(
          color: ColorConst.fieldtextCol,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12,
        ),
        suffixIcon: Icon(widget.suffixIcon, color: ColorConst.iconCol),
        prefixIcon: Icon(widget.prefixIcon, color: ColorConst.iconCol),

        border: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ColorConst.fieldborderCol,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorConst.fieldborderCol),
          borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ColorConst.fieldborderCol,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ColorConst.fieldborderCol,
            width: 1,
          ),
        ),
      ),
    );
  }
}
