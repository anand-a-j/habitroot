import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/features/home/presentation/screen/dashboard_screen.dart';
import 'package:habitroot/features/settings/presentation/screen/general_screen.dart';
import 'package:habitroot/features/settings/presentation/screen/reorder_screen.dart';
import 'package:habitroot/features/settings/presentation/screen/settings_screen.dart';
import 'package:habitroot/features/splash/splash_screen.dart';
import 'package:habitroot/routes/page_transition.dart';
import 'package:hive_ce/hive.dart';

import '../core/enum/box_types.dart';
import '../features/analytics/presentation/screen/analytics_screen.dart';
import '../features/habit/domain/habit.dart';
import '../features/habit/presentation/screen/habit_add_screen.dart';
import '../features/home/presentation/screen/home_screen.dart';
import '../features/settings/presentation/screen/archive_screen.dart';

final Box<dynamic> settings = Hive.box(BoxType.settings.name);



final GoRouter router = GoRouter(
  initialLocation: "/",
  observers: [HeroController()],
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'splash-screen',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/home',
      name: 'home-screen',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return FadeTransitionPage(page: HomeScreen());
      },
    ),
    GoRoute(
      path: '/dashboard',
      name: 'dashboard-screen',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return FadeTransitionPage(
          page: DashboardScreen(),
        );
      },
    ),
    GoRoute(
      path: '/habit-add',
      name: 'habit-add-screen',
      pageBuilder: (BuildContext context, GoRouterState state) {
        final habit = state.extra as Habit?;
        return SlideTransitionPage(
          page: HabitAddScreen(habit: habit, isEdit: habit != null),
          beginOffset: const Offset(0.0, 1.0),
        );
      },
    ),
    GoRoute(
      path: '/settings',
      name: 'settings-screen',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return SlideTransitionPage(
          page: SettingsScreen(),
          beginOffset: const Offset(0.0, 1.0),
        );
      },
    ),
    GoRoute(
      path: '/archive',
      name: 'archive-screen',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return FadeTransitionPage(
          page: ArchiveScreen(),
        );
      },
    ),
    GoRoute(
      path: '/reorder',
      name: 'reorder-screen',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return FadeTransitionPage(
          page: ReorderScreen(),
        );
      },
    ),
    GoRoute(
      name: 'analytics-screen',
      path: '/analytics',
      pageBuilder: (context, state) {
        final habit = state.extra as Habit?;
        return SlideTransitionPage(
          page: AnalyticsScreen(habit: habit),
          beginOffset: const Offset(0, 1),
        );
      },
    ),
    GoRoute(
      name: 'general-screen',
      path: '/general',
      pageBuilder: (context, state) {
        return SlideTransitionPage(
          page: const GeneralScreen(),
          beginOffset: const Offset(0, 1),
        );
      },
    ),
  ],
);
