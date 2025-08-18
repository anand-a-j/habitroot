import 'package:habitroot/core/extension/common.dart';
import 'package:flutter/material.dart';

class HabitRootTextField extends StatelessWidget {
  const HabitRootTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.initialValue,
    this.enabled = true,
    this.readOnly = false,
    required this.hintText,
    this.textInputType,
    this.obscureText,
    this.maxLines,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.validator,
    this.onChanged,
    this.suffix,
    this.suffixIcon,
    this.hideErrorText = false,
    this.isOnPrimary = true,
    this.contentPaddingBotttom = 15,
    this.onTap,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String hintText;
  final TextInputType? textInputType;
  final bool? obscureText;
  final bool? readOnly;
  final String? initialValue;
  final int? maxLines;
  final int? maxLength;
  final bool enabled;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextAlign textAlign;
  final double contentPaddingBotttom;
  final bool hideErrorText;
  final bool isOnPrimary;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      initialValue: initialValue,
      onTap: onTap,
      textAlign: textAlign,
      enabled: enabled,
      readOnly: readOnly ?? false,
      keyboardType: textInputType,
      obscureText: obscureText ?? false,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      validator: validator,
      onChanged: onChanged,
      style: context.bodyMedium,
      decoration: InputDecoration(
        filled: true,
        fillColor: context.onSecondary,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        isDense: true,
        hintText: hintText,
        hintStyle: context.bodyMedium?.copyWith(
          color: context.onPrimary.withValues(alpha: 0.5),
          fontWeight: FontWeight.w300,
        ),
        suffix: suffix,
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
          child: suffixIcon,
        ),
        suffixIconConstraints: const BoxConstraints(maxHeight: 30),
        errorStyle: hideErrorText
            ? const TextStyle(fontSize: 0.01)
            : TextStyle(
                fontSize: 10,
                color: context.primary,
                fontWeight: FontWeight.w300,
              ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.onSecondaryContainer,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.onSecondaryContainer,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.onPrimary,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.error,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
