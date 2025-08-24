import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/components/core_components.dart';
import 'package:habitroot/core/constants/constants.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/features/notification/data/notification_service.dart';

import '../widgets/dash_add_habit_button.dart';
import '../widgets/habit_heap_card.dart';
import '../widgets/habit_listview.dart';
import '../widgets/habit_today_card.dart';
import '../widgets/habit_weekly_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Weekly",
            style: context.titleMedium,
          ),
          actions: [
            GestureDetector(
              onTap: () => context.pushNamed('analytics-screen'),
              child: SvgBuild(assetImage: Assets.analytics),
            ),
            const SizedBox(width: AppConsts.pMedium),
            GestureDetector(
              onTap: () => context.pushNamed('settings-screen'),
              child: SvgBuild(assetImage: Assets.settings),
            ),
            const SizedBox(width: AppConsts.pSide),
          ],
          // ❌ Don't add TabBar yet (we’ll add later)
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            HabitListView(
              cardBuilder: (id) => HabitWeeklyCard(),
            ),
            HabitListView(
              cardBuilder: (id) => HabitHeapCard(),
            ),
            HabitListView(
              cardBuilder: (id) => HabitTodayCard(),
            ),
          ],
        ),
        floatingActionButton: DashAddHabitButton(),
      ),
    );
  }
}
