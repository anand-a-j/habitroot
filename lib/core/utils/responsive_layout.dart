import 'package:flutter/material.dart';

class ResponsiveLayout {
  static double calendarHeightEQ(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    // 1️⃣ Compute one cell’s width & height
    //    • horizMargin is the total left+right margin you give each cell
    const double horizMargin = 4;
    final double cellWidth = (size.width - (7 * horizMargin)) / 7;
    final double cellHeight = cellWidth * (46 / 44);

    // 2️⃣ Header height (month title + weekday labels + spacers)
    //    Tweak these values to match your actual widgets:
    // const double monthTitleHeight = 10;

    const double weekdaysRowHeight = 46;
    const double gapBelowWeekdays = 15;
    const double headerHeight = weekdaysRowHeight + gapBelowWeekdays;

    // 3️⃣ Total = header + (6 rows × cell height)
    const int totalRows = 6;
    return headerHeight + (totalRows * cellHeight);
  }

  static double habitDetailsSheetHeight(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    // 1️⃣ Compute one cell’s width & height
    //    • horizMargin is the total left+right margin you give each cell
    const double horizMargin = 4;
    final double cellWidth = (size.width - (7 * horizMargin)) / 7;
    final double cellHeight = cellWidth * (46 / 44);

    // 2️⃣ Header height (month title + weekday labels + spacers)
    //    Tweak these values to match your actual widgets:
    // const double monthTitleHeight = 10;

    const double weekdaysRowHeight = 46;
    const double gapBelowWeekdays = 15;
    const double headerHeight = weekdaysRowHeight + gapBelowWeekdays;

    // 3️⃣ Total = header + (6 rows × cell height)
    const int totalRows = 6;
    return (headerHeight + (totalRows * cellHeight)) + 158 - 50;
  }
}
