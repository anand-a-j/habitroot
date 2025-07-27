import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/constants/constants.dart';
import 'package:habitroot/features/analytics/presentation/utils/stats_utils.dart';
import 'package:habitroot/features/analytics/presentation/widgets/overall_info_card.dart';
import 'package:habitroot/features/analytics/presentation/widgets/strength_line_chart.dart';

import '../../../../core/components/core_components.dart';
import '../../../habit/presentation/provider/habit_provider.dart';
import '../widgets/strength_card.dart';

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(
      habitProvider.select(
        (map) {
          final habits = map.values.where((habit) => !habit.isArchived).toList()
            ..sort((a, b) => a.order.compareTo(b.order));

          return habits;
        },
      ),
    );
    return Scaffold(
      appBar: HabitRootAppBar(
        leadingOnTap: () => context.pop(),
        title: analyticsEn,
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          top: AppConsts.pLarge,
          right: AppConsts.pSide,
          left: AppConsts.pSide,
        ),
        physics: const BouncingScrollPhysics(),
        children: [
          StrengthCard(habits: habits),
          const SizedBox(height: AppConsts.pMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: AppConsts.pMedium,
            children: [
              Expanded(
                child: OverallInfoCard(
                  title: "Total Completion",
                  value: StatsUtils.calTotalCompletion(habits).toString(),
                ),
              ),
              Expanded(
                child: OverallInfoCard(
                  title: "Consistency",
                  value:
                      "${StatsUtils.calConsistencyPercentage(habits).toStringAsFixed(2)}%",
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConsts.pMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: AppConsts.pMedium,
            children: [
              Expanded(
                child: OverallInfoCard(
                  title: "Current Streak",
                  value: "${StatsUtils.calOverallCurrentStreak(habits)} days",
                ),
              ),
              Expanded(
                child: OverallInfoCard(
                  title: "Best Streak",
                  value: "${StatsUtils.calOverallBestStreak(habits)} days",
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConsts.pMedium),
          StrengthLineChart(habits: habits)
        ],
      ),
    );
  }
}
