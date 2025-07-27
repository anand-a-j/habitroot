import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitroot/features/home/presentation/widgets/habit_heap_card.dart';

import '../../../habit/presentation/provider/habit_provider.dart';

class HabitListView extends ConsumerWidget {
  const HabitListView({super.key});

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
    return habitIds.isEmpty
        ? Text(
            "NO Habits",
            style: TextStyle(color: Colors.white),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              final habitId = habitIds[index];
              return ProviderScope(
                overrides: [currentHabitId.overrideWithValue(habitId)],
                child: const HabitHeapCard(),
              );
            },
            itemCount: habitIds.length,
          );
  }
}
