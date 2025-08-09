import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitroot/core/utils/snackbar_manager.dart';

import 'core/constants/app_constants.dart';
import 'core/service/hive_ce_service.dart';
import 'core/theme/app_theme.dart';
import 'features/notification/data/notification_service.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  await NotificationService.init();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      //
      routerConfig: router,
      scaffoldMessengerKey: Snack.messengerKey,
      title: AppConsts.appName,
      themeMode: ThemeMode.dark,
      darkTheme: AppThemes.darkThemeData(context),
    );
  }
}
