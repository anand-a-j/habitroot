import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/components/core_components.dart';
import 'package:habitroot/core/constants/app_constants.dart';
import 'package:habitroot/features/settings/presentation/widgets/archive_card.dart';

import '../../../../core/constants/strings.dart';
import '../../../habit/presentation/provider/habit_provider.dart';

class ArchiveScreen extends ConsumerWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final archivedHabits = ref.watch(
      habitProvider.select(
        (map) {
          final habits = map.values.where((habit) => habit.isArchived).toList()
            ..sort((a, b) => a.order.compareTo(b.order));

          return habits;
        },
      ),
    );
    return Scaffold(
      appBar: HabitRootAppBar(
        leadingOnTap: () => context.pop(),
        title: arcivedHabitsEn,
      ),
      body: archivedHabits.isEmpty
          ? const Center(child: Text('No archived habits found.'))
          : ListView.builder(
              padding: const EdgeInsets.only(
                top: AppConsts.pLarge,
                right: AppConsts.pSide,
                left: AppConsts.pSide,
              ),
              itemCount: archivedHabits.length,
              itemBuilder: (context, index) {
                final habit = archivedHabits[index];
                return ArchiveCard(habit: habit);
              },
            ),
    );
  }
}
