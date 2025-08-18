import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/constants/app_constants.dart';
import 'package:habitroot/core/constants/assets.dart';
import 'package:habitroot/core/constants/strings.dart';
import 'package:habitroot/features/settings/presentation/widgets/settings_card.dart';

import '../../../../core/components/core_components.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HabitRootAppBar(
        leadingOnTap: () => context.pop(),
        title: settingsEn,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
        children: [
          const SizedBox(height: AppConsts.pLarge),
          const SizedBox(height: AppConsts.pLarge),
          SettingsCard(
            leadingIcon: Assets.settings,
            title: generalEn,
          ),
          SettingsCard(
            leadingIcon: Assets.theme,
            title: "Theme",
            onTap: () {
                      context.pushNamed('theme-screen');
            },
          ),
          SettingsCard(
            leadingIcon: Assets.archive,
            title: arcivedHabitsEn,
            onTap: () {
              context.pushNamed('archive-screen');
            },
          ),
          SettingsCard(
            leadingIcon: Assets.folderUp,
            title: dateImportExportEn,
          ),
          SettingsCard(
            leadingIcon: Assets.arrowUpDown,
            title: reorderHabitsEn,
            onTap: () {
              context.pushNamed('reorder-screen');
            },
          ),
          const SizedBox(height: AppConsts.pLarge),
          SettingsCard(
            leadingIcon: Assets.shield,
            title: privacyPolicyEn,
          ),
          SettingsCard(
            leadingIcon: Assets.newspaper,
            title: termsOfUseEn,
          ),
          SettingsCard(
            leadingIcon: Assets.star,
            title: rateTheAppEn,
          ),
          SettingsCard(
            leadingIcon: Assets.externalLink,
            title: shareTheAppEn,
          ),
          SettingsCard(
            leadingIcon: Assets.messageSquareDiff,
            title: feedbackEn,
          ),
        ],
      ),
    );
  }
}
