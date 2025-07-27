import '../../features/habit/domain/habit.dart';

extension HabitExtensions on Habit {
  Habit toggleCompleted({DateTime? forDate}) {
    final now = DateTime.now();
    final date = forDate ?? DateTime(now.year, now.month, now.day);

    final isAlreadyCompleted = completedDates.any(
      (d) => d.year == date.year && d.month == date.month && d.day == date.day,
    );

    if (isAlreadyCompleted) {
      // Unmark: remove the date
      final updatedDates = completedDates
          .where((d) => !(d.year == date.year &&
              d.month == date.month &&
              d.day == date.day))
          .toList();

      // Recalculate lastCompleted and streak
      final sortedDates = updatedDates..sort((a, b) => b.compareTo(a));
      final newLastCompleted =
          sortedDates.isNotEmpty ? sortedDates.first : null;

      int newStreak = 0;
      DateTime? streakDate = newLastCompleted;
      while (streakDate != null && updatedDates.contains(streakDate)) {
        newStreak++;
        streakDate = streakDate.subtract(const Duration(days: 1));
        if (!updatedDates.any((d) =>
            d.year == streakDate!.year &&
            d.month == streakDate.month &&
            d.day == streakDate.day)) {
          break;
        }
      
      }

      return copyWith(
        completedDates: updatedDates,
        lastCompleted: newLastCompleted,
        streak: newStreak,
      );
    }

    // If not completed, mark as completed
    final yesterday = date.subtract(const Duration(days: 1));
    final isStreakContinuing = lastCompleted != null &&
        DateTime(lastCompleted!.year, lastCompleted!.month,
                lastCompleted!.day) ==
            yesterday;

    return copyWith(
      completedDates: [...completedDates, date],
      lastCompleted: date,
      streak: isStreakContinuing ? streak + 1 : 1,
    );
  }

  bool get isCompletedToday {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return completedDates.any(
      (d) =>
          d.year == today.year && d.month == today.month && d.day == today.day,
    );
  }
}
