import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habitroot/core/components/core_components.dart';
import 'package:habitroot/core/constants/constants.dart';
import 'package:habitroot/core/enum/weekday.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/core/utils/snackbar_manager.dart';
import 'package:habitroot/features/notification/data/notification_service.dart';
import '../../../../core/components/weekday_listview.dart';

class HabitReminderCard extends StatefulWidget {
  const HabitReminderCard({
    super.key,
    required this.selectedDays,
    required this.onChange,
    required this.onTimeChanged,
    required this.onToggle,
    this.initialReminderOn = false, // ✅ from parent
    this.initialTime = const TimeOfDay(hour: 12, minute: 0), // ✅ from parent
  });

  final List<Weekday> selectedDays;

  final void Function(List<Weekday>) onChange;
  final void Function(TimeOfDay) onTimeChanged;
  final void Function(bool) onToggle;

  final bool initialReminderOn; // ✅
  final TimeOfDay initialTime; // ✅

  @override
  State<HabitReminderCard> createState() => _HabitReminderCardState();
}

class _HabitReminderCardState extends State<HabitReminderCard>
    with TickerProviderStateMixin {
  late final ValueNotifier<bool> _isReminderOn;
  late final ValueNotifier<TimeOfDay> _selectedTime;

  @override
  void initState() {
    super.initState();
    _isReminderOn = ValueNotifier<bool>(widget.initialReminderOn);
    _selectedTime = ValueNotifier<TimeOfDay>(widget.initialTime);
  }

  @override
  void dispose() {
    _isReminderOn.dispose();
    _selectedTime.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isReminderOn,
      builder: (context, isOn, _) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: context.onSecondary,
            borderRadius: BorderRadius.circular(AppConsts.rSmall),
            border: Border.all(
              width: 1,
              color: context.onSecondaryContainer,
            ),
          ),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Reminder",
                      style: context.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        value: isOn,
                        onChanged: (value) async {
                          final granted =
                              await NotificationService.requestNotificationPermission();

                          if (granted) {
                            _isReminderOn.value = value;
                            widget.onToggle(value);
                          } else {
                            Snack.error(
                              "Please enable notifications in settings",
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),

                if (isOn) ...[
                  Column(
                    children: [
                      const SizedBox(height: 15),
                      WeekdayListview(
                        selectedDays: widget.selectedDays,
                        onChange: widget.onChange,
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () async {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: context.onSecondary,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16)),
                            ),
                            builder: (context) {
                              TimeOfDay tempTime = _selectedTime.value;

                              return SizedBox(
                                height: 250,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.time,
                                        initialDateTime: DateTime(
                                          0,
                                          0,
                                          0,
                                          _selectedTime.value.hour,
                                          _selectedTime.value.minute,
                                        ),
                                        use24hFormat: false,
                                        onDateTimeChanged:
                                            (DateTime newDateTime) {
                                          tempTime = TimeOfDay(
                                            hour: newDateTime.hour,
                                            minute: newDateTime.minute,
                                          );
                                        },
                                      ),
                                    ),
                                    CupertinoButton(
                                      child: const Text("Done"),
                                      onPressed: () {
                                        _selectedTime.value = tempTime;
                                        widget.onTimeChanged(tempTime);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: context.secondary,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgBuild(
                                  assetImage: Assets.clockPlus,
                                  colorFilter: ColorFilter.mode(
                                    context.primary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                ValueListenableBuilder<TimeOfDay>(
                                  valueListenable: _selectedTime,
                                  builder: (context, time, _) {
                                    final formattedTime = time.format(context);
                                    return Text(
                                      formattedTime,
                                      style: context.bodyLarge?.copyWith(
                                        color: context.primary,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
