import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/extension/common.dart';

class DashAddHabitButton extends StatelessWidget {
  const DashAddHabitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        context.pushNamed("habit-add-screen");
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: context.primary.withOpacity(0.25),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: context.primary, width: 0.85),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 6,
              children: [
                Icon(
                  Icons.add,
                  color: context.primary.withOpacity(0.9),
                  grade: -25.0,
                  weight: 100,
                ),
                Text(
                  "Add a Habit",
                  style: context.bodyLarge?.copyWith(
                    color: context.primary.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
