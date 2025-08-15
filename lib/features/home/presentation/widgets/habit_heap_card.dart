import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitroot/core/components/core_components.dart';
import 'package:habitroot/core/constants/constants.dart';
import 'package:habitroot/core/enum/date_event.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/core/extension/habit_extension.dart';
import 'package:habitroot/features/calendar/domain/calendar_event.dart';
import 'package:habitroot/features/calendar/presentation/heap_map_calendar.dart';

import '../../../habit/presentation/provider/habit_provider.dart';
import '../components/habit_details_bottom_sheet.dart';

final currentHabitId = Provider<String>((ref) => throw UnimplementedError());

class HabitHeapCard extends ConsumerWidget {
  const HabitHeapCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _size = MediaQuery.sizeOf(context);

    final habitId = ref.watch(currentHabitId);
    final habit = ref.watch(habitByIdProvider(habitId));
    final habitColor = habit.color;

    log("habit.color : ${habit.color}");

    log("habit color int after parse : ${habitColor}");

    final events = habit.completedDates
        .map((date) => CalendarEvent(
              date: DateTime(date.year, date.month, date.day),
              event: DateEvent.completed,
            ))
        .toList();

    final now = DateTime.now();
    final oneYearAgo = now.subtract(const Duration(days: 365));
    final startDate =
        habit.createdAt.isBefore(oneYearAgo) ? habit.createdAt : oneYearAgo;
    log("habit color : ${habit.color}");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
      child: GestureDetector(
        onTap: () {
          showHabitDetailsSheet(context, habit);
        },
        child: Column(
          children: [
            const SizedBox(height: AppConsts.pSide),
            Container(
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
                children: [
                  Row(
                    spacing: AppConsts.pSmall,
                    crossAxisAlignment: habit.description != null &&
                            habit.description!.isNotEmpty
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: [
                      Text(
                        habit.icon,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: _size.width - 174,
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
                              width: _size.width - 174,
                              child: Text(
                                habit.description ?? "",
                                style: context.labelLarge?.copyWith(
                                  color: context.surface,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                        ],
                      ),
                      const Spacer(),
                      _HabitMarkButton(
                        backgroundColor: Color(habitColor),
                        habitId: habit.id,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConsts.pMedium),
                  HeatMapCalendar(
                      startDate: startDate,
                      endDate: DateTime.now(),
                      events: events,
                      baseColor: Color(habitColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HabitMarkButton extends ConsumerWidget {
  const _HabitMarkButton({
    required this.backgroundColor,
    required this.habitId,
  });

  final Color backgroundColor;
  final String habitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCompletedToday = ref.watch(
      habitByIdProvider(habitId).select((h) => h.isCompletedToday),
    );

    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        final habit = ref.read(habitByIdProvider(habitId));
        final updatedHabit = habit.toggleCompleted();
        ref.read(habitProvider.notifier).updateHabit(updatedHabit);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isCompletedToday
              ? backgroundColor
              : backgroundColor.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(AppConsts.rMacro),
        ),
        child: const Center(
          child: SvgBuild(assetImage: Assets.tick),
        ),
      ),
    );
  }
}
