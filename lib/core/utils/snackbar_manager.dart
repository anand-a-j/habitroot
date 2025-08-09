import 'package:flutter/material.dart';

import '../theme/app_color_scheme.dart';

class Snack {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void success(String message) => _show(message, AppColorScheme.primary);

  static void error(String message) => _show(message, AppColorScheme.error);

  static void info(String message) =>
      _show(message, Colors.blue);

  static void _show(String text, Color color) {
    messengerKey.currentState?.hideCurrentSnackBar();
    messengerKey.currentState?.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        margin: const EdgeInsets.all(16),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        duration: const Duration(seconds: 3),
        content: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Gotham',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColorScheme.onPrimary,
          ),
        ),
      ),
    );
  }

  static void hide() => messengerKey.currentState?.hideCurrentSnackBar();
}
