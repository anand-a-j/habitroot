import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitroot/core/extension/habit_extension.dart';

import '../../../../core/components/core_components.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/constants.dart';
import '../../../habit/presentation/provider/habit_provider.dart';

class HabitMarkButton extends ConsumerWidget {
  const HabitMarkButton({
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
