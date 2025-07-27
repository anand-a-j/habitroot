import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/components/core_components.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/core/extension/habit_extension.dart';
import 'package:habitroot/features/calendar/presentation/menu_month_calendar.dart';
import 'package:habitroot/features/habit/domain/habit.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/enum/date_event.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../../../calendar/domain/calendar_event.dart';
import '../../../habit/presentation/provider/habit_provider.dart';
import '../components/habit_sheet_quick_button.dart';

void showHabitDetailsSheet(BuildContext context, Habit habit) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return HabitDetailsSheetCard(habit: habit);
    },
  );
}

class HabitDetailsSheetCard extends ConsumerWidget {
  const HabitDetailsSheetCard({super.key, required this.habit});

  final Habit habit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentHabit = ref.watch(habitByIdProvider(habit.id));
    final size = MediaQuery.sizeOf(context);
    final habitColor = currentHabit.color;

    // state
    final isCompletedToday = ref.watch(
      habitByIdProvider(habit.id).select((h) => h.isCompletedToday),
    );

    final events = currentHabit.completedDates
        .map((date) => CalendarEvent(
              date: DateTime(date.year, date.month, date.day),
              event: DateEvent.completed,
            ))
        .toList();

    final now = DateTime.now();
    final oneYearAgo = now.subtract(const Duration(days: 365));
    final startDate =
        habit.createdAt.isBefore(oneYearAgo) ? habit.createdAt : oneYearAgo;
    return Container(
      height: ResponsiveLayout.habitDetailsSheetHeight(context),
      margin: const EdgeInsets.only(
        left: AppConsts.pSide,
        right: AppConsts.pSide,
        bottom: AppConsts.pExtraLarge,
      ),
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
          Column(
            children: [
              Row(
                spacing: AppConsts.pSmall,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        width: size.width - 160,
                        child: Text(
                          currentHabit.name,
                          style: context.bodyMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (currentHabit.description != null &&
                          currentHabit.description!.isNotEmpty)
                        SizedBox(
                          width: size.width - 160,
                          child: Text(
                            currentHabit.description ?? "",
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 26,
                      width: 26,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: context.onSecondary,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 0.8,
                          color: context.onSecondaryContainer,
                        ),
                      ),
                      child: Center(
                          child: SvgBuild(
                        assetImage: Assets.x,
                        colorFilter: ColorFilter.mode(
                          context.onPrimary,
                          BlendMode.srcIn,
                        ),
                      )),
                    ),
                  )
                ],
              ),
              const SizedBox(height: AppConsts.pMedium),
              HabitRootMonthCalendar(
                selectedDay: DateTime.now(),
                changeDay: (date, event) {
                  HapticFeedback.lightImpact();

                  final updatedHabit =
                      currentHabit.toggleCompleted(forDate: date);

                  ref.read(habitProvider.notifier).updateHabit(updatedHabit);
                },
                startDate: startDate,
                endDate: now,
                events: events,
                baseColor:
                    habitColor != null ? Color(habitColor) : context.primary,
              ),
              const SizedBox(height: AppConsts.pMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                spacing: AppConsts.pSmall,
                children: [
                  Expanded(
                    child: HabitSheetQuickButton(
                      type: QuickButtonType.achieve,
                      onTap: () {
                        HapticFeedback.lightImpact();

                        final updatedHabit = currentHabit.copyWith(
                          isArchived: currentHabit.isArchived ? false : true,
                        );

                        ref.read(habitProvider.notifier).updateHabit(
                              updatedHabit,
                            );
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: HabitSheetQuickButton(
                      type: QuickButtonType.edit,
                      onTap: () {
                        Navigator.pop(context);
                        context.pushNamed(
                          'habit-add-screen',
                          extra: currentHabit,
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: HabitSheetQuickButton(
                      type: QuickButtonType.done,
                      onTap: () {
                        final currentHabit =
                            ref.read(habitByIdProvider(habit.id));
                        log("onTap test : ${currentHabit.isCompletedToday}");
                        HapticFeedback.lightImpact();

                        final updatedHabit = currentHabit.toggleCompleted();
                        log("update habit : ${updatedHabit.completedDates}");

                        ref
                            .read(habitProvider.notifier)
                            .updateHabit(updatedHabit);
                      },
                      isCompleted: isCompletedToday,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
