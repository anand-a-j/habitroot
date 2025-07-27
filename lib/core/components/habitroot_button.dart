import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habitroot/core/extension/common.dart';

class HabitRootButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;

  const HabitRootButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        height: 56,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            onPressed();
          },
          child: Text(
            label,
            style: context.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
