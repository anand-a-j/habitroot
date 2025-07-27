import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:habitroot/core/extension/common.dart';
import '../../../../core/constants/constants.dart';
import '../../../habit/domain/habit.dart';

class StrengthLineChart extends StatelessWidget {
  const StrengthLineChart({
    super.key,
    required this.habits,
  });

  final List<Habit> habits;

  @override
  Widget build(BuildContext context) {
    final strengthEntries = _getStrengthOverLastNDays(habits, 90);

    final List<FlSpot> spots = strengthEntries
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.value))
        .toList();

    final Map<int, DateTime> indexToDate = strengthEntries
        .asMap()
        .map((index, entry) => MapEntry(index, entry.key));

    final labelInterval =
        (strengthEntries.length / 6).roundToDouble().clamp(1, 15);

    return Container(
      height: 300,
      width: 400,
      padding: const EdgeInsets.all(AppConsts.pMedium),
      decoration: BoxDecoration(
        color: context.onSecondary,
        borderRadius: BorderRadius.circular(AppConsts.rSmall),
        border: Border.all(
          width: 1,
          color: context.onSecondaryContainer,
        ),
      ),
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 32),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 36,
                interval: labelInterval.toDouble(),
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  final date = indexToDate[index];
                  if (date == null) return const SizedBox.shrink();

                  final label = DateFormat.MMMd().format(date); // e.g. Jul 12
                  return SideTitleWidget(
                    meta: meta,
                    child: Text(
                      label,
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                },
              ),
            ),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: strengthEntries.length.toDouble() - 1,
          minY: 0,
          maxY: 100,
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              barWidth: 2,
              color: context.primary,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}

List<MapEntry<DateTime, double>> _getStrengthOverLastNDays(
    List<Habit> habits, int days) {
  final now = DateTime.now();
  final List<MapEntry<DateTime, double>> results = [];

  for (int i = 0; i < days; i++) {
    final day = now.subtract(Duration(days: i));
    final dayStart = DateTime(day.year, day.month, day.day);

    double totalStrength = 0;
    int countedHabits = 0;

    for (final habit in habits) {
      if (habit.createdAt.isAfter(dayStart)) continue;

      final completedToday = habit.completedDates.any((d) =>
          d.year == day.year && d.month == day.month && d.day == day.day);
      final streakFactor = (habit.streak / 30).clamp(0.0, 1.0);
      final frequencyFactor = (habit.completedDates.length /
              DateTime.now()
                  .difference(habit.createdAt)
                  .inDays
                  .clamp(1, 100000))
          .clamp(0.0, 1.0);

      const w1 = 0.6;
      const w2 = 0.25;
      const w3 = 0.15;

      final dailyStrength = ((completedToday ? 1.0 : 0.0) * w1 +
              streakFactor * w2 +
              frequencyFactor * w3) *
          100;

      totalStrength += dailyStrength;
      countedHabits++;
    }

    final avg = countedHabits == 0 ? 0.0 : (totalStrength / countedHabits);
    results.add(MapEntry(dayStart, avg));
  }

  return results.reversed.toList();
}
