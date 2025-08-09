import '../../../../core/enum/date_event.dart';
import '../../../calendar/domain/calendar_event.dart';
import '../../../habit/domain/habit.dart';

class StatsUtils {
  static int calOverallStrength(List<Habit> habits) {
    if (habits.isEmpty) return 0;

    final now = DateTime.now();

    double totalStrength = 0;

    for (final habit in habits) {
      final past30Days = now.subtract(Duration(days: 30));

      final recentCompletions =
          habit.completedDates.where((d) => d.isAfter(past30Days)).length;
      final consistencyRate = recentCompletions / 30;

      final streakFactor = (habit.streak / 30).clamp(0.0, 1.0);

      final habitAge = now.difference(habit.createdAt).inDays.clamp(1, 100000);
      final frequencyFactor =
          (habit.completedDates.length / habitAge).clamp(0.0, 1.0);

      const w1 = 0.5; // weight: consistency
      const w2 = 0.3; // weight: streak
      const w3 = 0.2; // weight: overall frequency

      final habitStrength =
          (consistencyRate * w1 + streakFactor * w2 + frequencyFactor * w3) *
              100;

      totalStrength += habitStrength.clamp(0.0, 100.0);
    }

    final averageStrength = totalStrength / habits.length;

    return averageStrength.round();
  }

  static int calTotalCompletion(List<Habit> habits) {
    return habits.fold(0, (sum, habit) => sum + habit.completedDates.length);
  }

  static double calConsistencyPercentage(List<Habit> habits) {
    if (habits.isEmpty) return 0.0;

    final now = DateTime.now();
    final startDate = now.subtract(Duration(days: 30));

    final Set<DateTime> uniqueDays = {};

    for (final habit in habits) {
      final recentDays = habit.completedDates
          .where((d) => d.isAfter(startDate))
          .map(
              (d) => DateTime(d.year, d.month, d.day)); // normalize to day only

      uniqueDays.addAll(recentDays);
    }

    final consistentDays = uniqueDays.length.clamp(0, 30);
    final percentage = (consistentDays / 30) * 100;

    return double.parse(percentage.toStringAsFixed(1)); // e.g. 73.3
  }

  static int calOverallCurrentStreak(List<Habit> habits) {
    if (habits.isEmpty) return 0;

    final Set<DateTime> allDays = habits
        .expand((h) => h.completedDates)
        .map((d) => DateTime(d.year, d.month, d.day))
        .toSet();

    int streak = 0;
    DateTime day = DateTime.now();

    while (allDays.contains(DateTime(day.year, day.month, day.day))) {
      streak++;
      day = day.subtract(Duration(days: 1));
    }

    return streak;
  }

  static int calOverallBestStreak(List<Habit> habits) {
    if (habits.isEmpty) return 0;

    final Set<DateTime> allDays = habits
        .expand((h) => h.completedDates)
        .map((d) => DateTime(d.year, d.month, d.day))
        .toSet();

    if (allDays.isEmpty) return 0;

    final sortedDays = allDays.toList()..sort();
    int bestStreak = 1;
    int currentStreak = 1;

    for (int i = 1; i < sortedDays.length; i++) {
      final prev = sortedDays[i - 1];
      final curr = sortedDays[i];

      if (curr.difference(prev).inDays == 1) {
        currentStreak++;
        bestStreak = currentStreak > bestStreak ? currentStreak : bestStreak;
      } else if (curr.difference(prev).inDays > 1) {
        currentStreak = 1;
      }
    }

    return bestStreak;
  }

  static List<CalendarEvent> getCalendarEvents(List<Habit> habits) {
    // Map to hold completion count for each date
    final Map<DateTime, int> completionCount = {};

    for (final habit in habits) {
      for (final date in habit.completedDates) {
        // Normalize to only year, month, day (ignore time)
        final dayKey = DateTime(date.year, date.month, date.day);
        completionCount[dayKey] = (completionCount[dayKey] ?? 0) + 1;
      }
    }

    // Determine max completions in a day for scaling
    final int maxCount = completionCount.values.isEmpty
        ? 0
        : completionCount.values.reduce((a, b) => a > b ? a : b);

    // Convert to list of CalendarEvent
    return completionCount.entries.map((entry) {
      final date = entry.key;
      final count = entry.value;

      return CalendarEvent(
        date: date,
        event: _mapCountToEvent(count, maxCount),
      );
    }).toList();
  }

  static DateEvent _mapCountToEvent(int count, int totalHabits) {
    if (count <= 0) return DateEvent.normal;
    if (totalHabits <= 0) return DateEvent.normal;

    final ratio = count / totalHabits;

    if (ratio <= 0.25) return DateEvent.low;
    if (ratio <= 0.5) return DateEvent.medium;
    if (ratio <= 0.75) return DateEvent.high;
    if (ratio > 0.75 && ratio < 1.0) return DateEvent.veryHigh;
    if (ratio == 1.0) return DateEvent.completed;

    return DateEvent.normal;
  }

  // static DateEvent _mapCountToEvent(int count, int maxCount) {
  //   if (count <= 0) return DateEvent.normal;

  //   // If you want fixed thresholds instead of scaling
  //   if (count == 1) return DateEvent.low;
  //   if (count == 2) return DateEvent.medium;
  //   if (count == 3) return DateEvent.high;
  //   if (count >= 4) return DateEvent.veryHigh;

  //   return DateEvent.normal;
  // }
}
