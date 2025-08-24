import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitroot/features/home/presentation/widgets/habit_heap_card.dart';
import 'package:habitroot/features/home/presentation/widgets/habit_today_card.dart';
import 'package:habitroot/features/home/presentation/widgets/habit_weekly_card.dart';

import '../../../habit/presentation/provider/habit_provider.dart';

class HabitListView extends ConsumerWidget {
  final Widget Function(String habitId) cardBuilder;

  const HabitListView({
    super.key,
    required this.cardBuilder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitIds = ref.watch(
      habitProvider.select(
        (map) {
          final habits = map.values.where((habit) => !habit.isArchived).toList()
            ..sort((a, b) => a.order.compareTo(b.order));

          return habits.map((habit) => habit.id).toList();
        },
      ),
    );

    if (habitIds.isEmpty) {
      return const Text(
        "NO Habits",
        style: TextStyle(color: Colors.white),
      );
    }

    return ListView.builder(
      itemCount: habitIds.length,
      itemBuilder: (context, index) {
        final habitId = habitIds[index];
        return ProviderScope(
          overrides: [
            heapCardHabitId.overrideWithValue(habitId),
            todayCardHabitId.overrideWithValue(habitId),
            weeklyCardHabitId.overrideWithValue(habitId),
          ],
          child: Builder(builder: (context) {
      
            return cardBuilder(habitId);
          }),
        );
      },
    );
  }
}
