import 'package:flutter/material.dart';
import 'package:habitroot/core/components/core_components.dart';
import 'package:habitroot/core/constants/assets.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/core/extension/time_extension.dart';
import 'package:habitroot/core/theme/app_color_scheme.dart';
import 'package:intl/intl.dart';

import '../../../core/enum/date_event.dart';
import '../domain/calendar_event.dart';

class HabitRootMonthCalendar extends StatefulWidget {
  const HabitRootMonthCalendar({
    super.key,
    required this.selectedDay,
    required this.changeDay,
    this.weekdays = const [
      'Sun',
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
    ],
    required this.startDate,
    required this.endDate,
    required this.events,
    this.baseColor = AppColorScheme.primary,
    this.isHeatMap = false,
  });

  final DateTime selectedDay;
  final Function(DateTime date, DateEvent event) changeDay;
  final List<String> weekdays;
  final DateTime startDate;
  final DateTime endDate;
  final List<CalendarEvent> events;
  final Color baseColor;
  final bool isHeatMap;

  @override
  State<HabitRootMonthCalendar> createState() => _HabitRootMonthCalendarState();
}

class _HabitRootMonthCalendarState extends State<HabitRootMonthCalendar> {
  late final PageController _controller;
  late final ValueNotifier<int> _currentPageNotifier;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: _getPageIndexForDate(widget.selectedDay),
    );

    _currentPageNotifier =
        ValueNotifier<int>(_getPageIndexForDate(widget.selectedDay));

    _controller.addListener(() {
      final int currentPage = _controller.page!.round();
      _currentPageNotifier.value = currentPage;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: ResponsiveLayout.calendarHeightEQ(context),
      height: 390,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  _controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
                  child: SvgBuild(
                    assetImage: Assets.circleChevronLeft,
                    colorFilter: ColorFilter.mode(
                      context.onPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              ValueListenableBuilder<int>(
                valueListenable: _currentPageNotifier,
                builder: (context, currentPage, _) {
                  final currentMonthDate = DateTime(
                    widget.startDate.year,
                    widget.startDate.month + currentPage,
                  );
                  final String monthYear =
                      DateFormat.yMMMM().format(currentMonthDate);
                  return Text(
                    monthYear,
                    style: context.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
                  child: SvgBuild(
                    assetImage: Assets.circleChevronRight,
                    colorFilter: ColorFilter.mode(
                      context.onPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget.weekdays
                .map(
                  (day) => Expanded(
                    child: Center(
                      child: Text(
                        day,
                        style: context.labelLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: _calculateTotalMonthsInRange(),
              itemBuilder: (_, monthIndex) => _buildMonthView(monthIndex),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthView(int monthIndex) {
    DateTime firstDayOfMonth =
        DateTime(widget.startDate.year, widget.startDate.month + monthIndex, 1);
    int daysInMonth = DateTime(
            widget.startDate.year, widget.startDate.month + monthIndex + 1, 0)
        .day;

    // Step 1: Find the first visible day (Sunday)
    int firstWeekday = firstDayOfMonth.weekday % 7; // 0=Sunday
    DateTime firstVisibleDay =
        firstDayOfMonth.subtract(Duration(days: firstWeekday));

    // Step 2: Generate 42 days (6 weeks)
    List<Widget> weeks = [];
    List<Widget> currentWeek = [];

    for (int i = 0; i < 42; i++) {
      DateTime day = firstVisibleDay.add(Duration(days: i));
      bool isInCurrentMonth = (day.month == firstDayOfMonth.month &&
          day.year == firstDayOfMonth.year);
      currentWeek.add(Expanded(child: _dateButton(day, isInCurrentMonth)));

      if (currentWeek.length == 7) {
        weeks.add(Row(children: currentWeek));
        currentWeek = [];
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: weeks,
    );
  }

  Widget _dateButton(DateTime dateTime, bool isInCurrentMonth) {
    final _width = MediaQuery.sizeOf(context).width;
    final _isSmallWidth = _width < 380;

    final String weekday = widget.weekdays[dateTime.weekday - 1];
    final bool isSelected = dateTime.isSameDay(widget.selectedDay);

    // Check the event for this date
    final CalendarEvent event = widget.events.firstWhere(
      (e) => e.date.isSameDay(dateTime),
      orElse: () => CalendarEvent(date: dateTime, event: DateEvent.normal),
    );

    return GestureDetector(
      onTap: () {
        bool isFutureDate = dateTime.isAfter(DateTime.now());
        if (!isFutureDate && isInCurrentMonth) {
          widget.changeDay(dateTime, event.event);
        }
      },
      child: Container(
        height: 40,
        width: 40,
        constraints: const BoxConstraints(
          maxWidth: 40,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          color: getHeatmapColor(event.event, widget.baseColor),
          borderRadius: BorderRadius.circular(50),
          border: isInCurrentMonth
              ? widget.isHeatMap
                  ? null
                  : event.event == DateEvent.completed || isSelected
                      ? Border.all(
                          width: 1,
                          color: widget.baseColor,
                        )
                      : null
              : null,
        ),
        child: Center(
          child: _EventDayCard(
            event: event,
            weekday: weekday,
            dateTime: dateTime,
            isSelected: isSelected,
            isInCurrentMonth: isInCurrentMonth,
          ),
        ),
      ),
    );
  }

  int _calculateTotalMonthsInRange() {
    int totalMonths = widget.endDate.month -
        widget.startDate.month +
        (12 * (widget.endDate.year - widget.startDate.year));
    return totalMonths + 1;
  }

  int _getPageIndexForDate(DateTime date) {
    int monthsBetween = (date.year - widget.startDate.year) * 12 +
        date.month -
        widget.startDate.month;
    return monthsBetween;
  }
}

class _EventDayCard extends StatelessWidget {
  final CalendarEvent event;
  final String weekday;
  final DateTime dateTime;
  final bool isSelected;
  final bool isInCurrentMonth;

  const _EventDayCard({
    required this.event,
    required this.weekday,
    required this.dateTime,
    required this.isSelected,
    required this.isInCurrentMonth,
  });

  @override
  Widget build(BuildContext context) {
    switch (event.event) {
      default:
        return Text(
          '${dateTime.day}',
          style: context.bodyMedium?.copyWith(
              color: isInCurrentMonth
                  ? context.onPrimary
                  : context.onPrimary.withValues(alpha: 0.5)),
        );
    }
  }
}
