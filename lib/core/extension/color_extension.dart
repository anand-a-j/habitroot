import 'package:flutter/material.dart';

extension ColorHelper on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get primary => colorScheme.primary;
  Color get onPrimary => colorScheme.onPrimary;

  Color get secondary => colorScheme.secondary;
  Color get secondaryFixed => colorScheme.secondaryFixed;
  Color get secondaryContainer => colorScheme.secondaryContainer;

  Color get onSecondary => colorScheme.onSecondary;
  Color get onSecondaryContainer => colorScheme.onSecondaryContainer;

  Color get error => colorScheme.error;
  Color get errorContainer => colorScheme.errorContainer;

  Color get surface => colorScheme.surface;

  Color get onSurface => colorScheme.onSurface;
}
