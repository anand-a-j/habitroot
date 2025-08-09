import 'package:flutter/material.dart';

enum DateEvent {
  normal,
  low,
  medium,
  high,
  veryHigh,
  completed,
}

Color getHeatmapColor(DateEvent event, Color baseColor) {
  switch (event) {
    case DateEvent.normal:
      return Colors.transparent; // no color
    case DateEvent.low:
      return baseColor.withValues(alpha: 0.2);
    case DateEvent.medium:
      return baseColor.withValues(alpha: 0.4);
    case DateEvent.high:
      return baseColor.withValues(alpha: 0.6);
    case DateEvent.veryHigh:
      return baseColor.withValues(alpha: 0.8);
    case DateEvent.completed:
      return baseColor.withValues(alpha: 1.0); // fully opaque
  }
}
