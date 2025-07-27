import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:habitroot/core/constants/app_constants.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/features/analytics/presentation/utils/stats_utils.dart';

import '../../../habit/domain/habit.dart';

class StrengthCard extends StatelessWidget {
  const StrengthCard({super.key,required this.habits});

  final List<Habit> habits;

  @override
  Widget build(BuildContext context) {
    final strength = StatsUtils.calOverallStrength(habits);
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
      child: Column(
        spacing: AppConsts.pMedium,
        children: [
          Text(
            "Strength",
            style: context.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 200,
            child: DashedCircularProgressBar.aspectRatio(
              aspectRatio: 1, // width ÷ height

              progress: strength.toDouble(),
              startAngle: 225,
              sweepAngle: 270,
              foregroundColor: Colors.green,
              backgroundColor: const Color(0xffeeeeee),
              foregroundStrokeWidth: 8,
              backgroundStrokeWidth: 8,
              animation: true,
              seekSize: 3,
              seekColor: const Color(0xffeeeeee),
              child: Center(
                child: Text(
                  '$strength%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 52,
                  ),
                ),
              ),
            ),
          ),
          Text(
            "Keep aiming for 80% on the strength meter. It takes time and consistency, but you're getting there!",
            style: context.labelLarge?.copyWith(
              color: context.surface,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
