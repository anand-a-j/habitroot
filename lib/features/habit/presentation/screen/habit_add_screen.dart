import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitroot/core/constants/constants.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/core/extension/time_extension.dart';
import 'package:habitroot/core/theme/app_color_scheme.dart';

import 'package:habitroot/core/utils/input_vaildator.dart';
import 'package:habitroot/features/habit/domain/habit.dart';
import 'package:habitroot/features/habit/presentation/provider/habit_provider.dart';
import 'package:habitroot/features/habit/presentation/widgets/habit_color_picker.dart';
import 'package:habitroot/features/habit/presentation/widgets/habit_reminder_card.dart';
import 'package:habitroot/features/habit/presentation/widgets/icon_color_pciker_sheet.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/components/core_components.dart';
import '../../../../core/enum/weekday.dart';
import '../../../../core/utils/string_utils.dart';
import '../../../notification/domain/reminder.dart';
import '../widgets/habit_emoji_picker.dart';

class HabitAddScreen extends ConsumerStatefulWidget {
  const HabitAddScreen({
    super.key,
    this.isEdit = false,
    this.habit,
  });

  final bool isEdit;
  final Habit? habit;

  @override
  ConsumerState<HabitAddScreen> createState() => _HabitAddScreenState();
}

class _HabitAddScreenState extends ConsumerState<HabitAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _desController = TextEditingController();
  final ValueNotifier<bool> _obscurePassword = ValueNotifier(true);
  String _habitIcon = "🌱";
  int _habitColor = AppColorScheme.habitColorOptions.first.value;

  final ValueNotifier<bool> _isReminderOn = ValueNotifier(false);
  final ValueNotifier<TimeOfDay> _reminderTime =
      ValueNotifier(TimeOfDay(hour: 20, minute: 0)); // 8:00 PM
  final ValueNotifier<List<Weekday>> _reminderDays =
      ValueNotifier(List<Weekday>.from(Weekday.values)); // all days

  @override
  void initState() {
    super.initState();
    if (widget.isEdit && widget.habit != null) {
      _initEditData(widget.habit!);
    }
  }

  void _initEditData(Habit habit) {
    _nameController.text = habit.name;
    _desController.text = habit.description ?? '';
    _habitIcon = habit.icon;
    _habitColor = habit.color;
  }

  @override
  void dispose() {
    _obscurePassword.dispose();
    _nameController.dispose();
    _desController.dispose();
    _isReminderOn.dispose();
    _reminderTime.dispose();
    _reminderDays.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormScaffold(
      appBar: HabitRootAppBar(
        leadingOnTap: () => context.pop(),
        title: createHabit,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConsts.pSide,
        ),
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              HabitRootTextField(
                controller: _nameController,
                hintText: nameYourHabit,
                textInputType: TextInputType.name,
                validator: (value) => InputVaildator.required(
                  value,
                  fieldName: nameEn,
                ),
              ),
              const SizedBox(height: AppConsts.pMedium),
              HabitRootTextField(
                controller: _desController,
                hintText: addAShortNote,
                textInputType: TextInputType.name,
                maxLines: 3,
              ),
              const SizedBox(height: AppConsts.pMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: AppConsts.pMedium,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        _habitColor = await showColorPicker(
                          context,
                          initialColor: _habitColor,
                        );

                        log("habit color : ${_habitColor}");

                        setState(() {});
                      },
                      child: Container(
                        height: 49,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: context.onSecondary,
                          borderRadius: BorderRadius.circular(AppConsts.rSmall),
                          border: Border.all(
                            width: 1,
                            color: context.onSecondaryContainer,
                          ),
                        ),
                        child: Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Color(_habitColor),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            Text(
                              "Color",
                              style: context.bodyMedium,
                            ),
                            const Spacer(),
                            SvgBuild(
                              assetImage: Assets.arrowRight,
                              colorFilter: ColorFilter.mode(
                                context.onPrimary,
                                BlendMode.srcIn,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final emoji = await showEmojiPickerSheet(context);

                        log("emoji : ${emoji}");
                        if (emoji != null) {
                          _habitIcon = emoji.emoji;
                        }
                        setState(() {});
                      },
                      child: Container(
                        height: 49,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: context.onSecondary,
                          borderRadius: BorderRadius.circular(AppConsts.rSmall),
                          border: Border.all(
                            width: 1,
                            color: context.onSecondaryContainer,
                          ),
                        ),
                        child: Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Center(
                                child: Text(
                                  _habitIcon,
                                  style: const TextStyle(
                                    fontSize: 26,
                                    height: 1,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Text(
                              "Icon",
                              style: context.bodyMedium,
                            ),
                            const Spacer(),
                            SvgBuild(
                              assetImage: Assets.arrowRight,
                              colorFilter: ColorFilter.mode(
                                context.onPrimary,
                                BlendMode.srcIn,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppConsts.pMedium),
              HabitReminderCard(
                selectedDays: _reminderDays.value,
                onChange: (weekdays) => _reminderDays.value = weekdays,
                onTimeChanged: (time) => _reminderTime.value = time,
                onToggle: (isEnabled) => _isReminderOn.value = isEnabled,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: HabitRootButton(
        padding: const EdgeInsetsGeometry.all(AppConsts.pSide),
        label: "Save",
        onPressed: () => _saveHabit(),
      ),
    );
  }

  void _saveHabit() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      final name = _nameController.text.trim();
      final des = _desController.text;

      final uuid = const Uuid();
      final habitId = widget.isEdit ? widget.habit!.id : uuid.v4();

      // Create reminder only if enabled
      Reminder? reminder;
      if (_isReminderOn.value) {
        reminder = Reminder(
          id: uuid.v4(),
          habitId: habitId,
          time: _reminderTime.value.to24HourString(),
          days: _reminderDays.value,
          isEnabled: true,
        );
      }

      print("reminder : ${reminder}");

      final habit = Habit(
        id: habitId,
        name: name,
        description: des,
        color: _habitColor,
        icon: _habitIcon,
        createdAt: widget.isEdit ? widget.habit!.createdAt : DateTime.now(),
        // Pass reminder here if you've added it to Habit model
        reminder: reminder, // ✅ make sure your Habit model accepts this
      );

      if (widget.isEdit) {
        ref.read(habitProvider.notifier).updateHabit(habit);
      } else {
        ref.read(habitProvider.notifier).addHabit(habit);
      }

      Navigator.pop(context);
    }
  }
}
