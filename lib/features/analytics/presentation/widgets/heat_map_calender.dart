import 'package:flutter/material.dart';
import 'package:habitroot/core/constants/app_constants.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/features/analytics/presentation/utils/stats_utils.dart';

import '../../../calendar/presentation/habitroot_month_calendar.dart';
import '../../../habit/domain/habit.dart';

class HeatMapCalender extends StatelessWidget {
  const HeatMapCalender({
    super.key,
    required this.habits,
  });

  final List<Habit> habits;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConsts.pMedium),
      decoration: BoxDecoration(
        color: context.onSecondary,
        borderRadius: BorderRadius.circular(AppConsts.rSmall),
        border: Border.all(
          width: 1,
          color: context.onSecondaryContainer,
        ),
      ),
      child: HabitRootMonthCalendar(
        selectedDay: DateTime.now(),
        changeDay: (date, event) {},
        startDate: DateTime.now().subtract(const Duration(days: 365 * 2)),
        endDate: DateTime.now(),
        events: StatsUtils.getCalendarEvents(habits),
      ),
    );
  }
}
