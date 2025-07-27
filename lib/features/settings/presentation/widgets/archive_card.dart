import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitroot/core/constants/strings.dart';
import 'package:habitroot/core/extension/common.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../habit/domain/habit.dart';
import '../../../habit/presentation/provider/habit_provider.dart';

class ArchiveCard extends StatelessWidget {
  const ArchiveCard({super.key, required this.habit});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppConsts.pSide,
        children: [
          Row(
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
                    width: size.width - 124,
                    child: Text(
                      habit.name,
                      style: context.bodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (habit.description != null &&
                      habit.description!.isNotEmpty)
                    SizedBox(
                      width: size.width - 124,
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
            ],
          ),
          _ArchieveButtonRow(habit: habit),
        ],
      ),
    );
  }
}

class _ArchieveButtonRow extends ConsumerWidget {
  const _ArchieveButtonRow({
    required this.habit,
  });

  final Habit habit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      spacing: AppConsts.pMedium,
      children: [
        GestureDetector(
          onTap: () {
            HapticFeedback.lightImpact();

            ref.read(habitProvider.notifier).deleteHabit(habit.id);
          },
          child: Text(
            deleteEn,
            style: context.bodySmall?.copyWith(
              color: context.error,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            HapticFeedback.lightImpact();

            final updatedHabit = habit.copyWith(
              isArchived: habit.isArchived ? false : true,
            );

            ref.read(habitProvider.notifier).updateHabit(
                  updatedHabit,
                );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: context.primary,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              restoreEn,
              style: context.bodySmall?.copyWith(
                color: context.onPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
