import 'package:flutter/material.dart';

mixin AppColorScheme {
  static const Color primary = Color(0XFF33C75A); //  Green
  static const Color onPrimary = Color(0XFFFFFFFF); //  Pure White

  static const Color secondary = Color(0XFF000000); // Pure Black
  static const Color secondaryContainer = Color(0XFF252527); // Grey variant
  static const Color secondaryFixed = Color(0xff18181b);// black varaint 

  static const Color onSecondary = Color(0XFF0F0F0F); // Black variant
  static const Color onSecondaryContainer =
      Color(0XFF3D3D3D); // for border stoke

  static const Color error = Color(0XFFdc2b31); // Red
  static const Color errorContainer = Color(0XFF7A1E0C); // dark red

  static const Color surface = Color(0XFFB0B0B0);

  static const Color scaffoldBackgroundColor = Color(0XFF000000); // Pure Black

  static const Color primaryTouchEffect = Color(0XFF56d276);

  /// Preset colors for habit selection (used in habit creation UI)
  static const List<Color> habitColorOptions = [
    // Greens & Teals
    Color(0XFF33C75A), // Green
    Color(0XFF00BFA5), // Teal – calm & refreshing

    // Blues & Purples
    Color(0XFF3978D7), // Blue
    Color(0XFF521CCD), // Purple
    Color(0XFF8E44AD), // Deep Violet – richer purple tone
    Color(0XFFD291BC), // Lavender – soft accent

    // Pinks & Reds
    Color(0XFFE71758), // Pink
    Color(0XFFFF6B6B), // Coral – warm pop
    Color(0XFFdc2b31), // Error Red (or core action color)

    // Yellows & Oranges
    Color(0XFFF8E71C), // Yellow
    Color(0XFFFFB300), // Mustard – muted warmth
    Color(0XFFFF8C00), // Orange – energetic accent
    Color(0XFFE67E22), // Carrot – warm mid‑tone

    // Neutrals
    Color(0XFFD9D9D9), // Light Grey
    Color(0XFFBDC3C7), // Soft Silver – neutral alternative
  ];
}
