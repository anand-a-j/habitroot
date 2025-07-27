import 'package:flutter/material.dart';

import 'package:habitroot/core/extension/common.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../habit/domain/habit.dart';

class ReorderCard extends StatelessWidget {
  const ReorderCard({super.key, required this.habit});

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final habitColor = habit.color;
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      padding: const EdgeInsets.all(AppConsts.pSmall),
      decoration: BoxDecoration(
        color: context.onSecondary,
        borderRadius: BorderRadius.circular(AppConsts.rSmall),
        border: Border.all(
          width: 1,
          color: context.onSecondaryContainer,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: AppConsts.pSmall,
        crossAxisAlignment:
            habit.description != null && habit.description!.isNotEmpty
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: habitColor != null
                ? Color(habitColor).withValues(alpha: 0.2)
                : context.primary.withValues(alpha: 0.2),
            radius: 20,
            child: Text(habit.icon),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width - 174,
                child: Text(
                  habit.name,
                  style: context.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (habit.description != null && habit.description!.isNotEmpty)
                SizedBox(
                  width: size.width - 174,
                  child: Text(
                    habit.description ?? "",
                    style: context.labelLarge?.copyWith(
                      color: context.surface,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.drag_indicator),
        ],
      ),
    );
  }
}
