import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/components/core_components.dart';
import 'package:habitroot/core/constants/constants.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/features/notification/data/notification_service.dart';

import '../widgets/dash_add_habit_button.dart';
import '../widgets/habit_listview.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Hero(
            tag: 'app-logo-hero-tag',
            child: const SvgBuild(assetImage: Assets.habitRoot),
          ),
          actions: [
            // GestureDetector(
            //     onTap: () {
            //       NotificationService.showTestNotification();
            //     },
            //     child: Icon(
            //       Icons.add,
            //       color: context.onPrimary,
            //     )),
            // const SizedBox(width: 40),
            GestureDetector(
              onTap: () {
                context.pushNamed('analytics-screen');
              },
              child: SvgBuild(
                assetImage: Assets.analytics,
              ),
            ),
            const SizedBox(width: AppConsts.pMedium),
            GestureDetector(
              onTap: () {
                context.pushNamed('settings-screen');
              },
              child: SvgBuild(
                assetImage: Assets.settings,
              ),
            ),
            const SizedBox(width: AppConsts.pSide),
          ],
        ),
        body: HabitListView(),
        floatingActionButton: DashAddHabitButton());
  }
}
