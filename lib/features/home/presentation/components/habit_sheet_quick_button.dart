// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:habitroot/core/components/core_components.dart';
import 'package:habitroot/core/constants/constants.dart';
import 'package:habitroot/core/extension/color_extension.dart';

enum QuickButtonType { achieve, edit, done }

class HabitSheetQuickButton extends StatelessWidget {
  final QuickButtonType type;
  void Function()? onTap;
  final bool isCompleted;

  HabitSheetQuickButton({
    super.key,
    required this.type,
    this.onTap,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor;
    final String icon;

    switch (type) {
      case QuickButtonType.achieve:
        backgroundColor = Colors.orange;
        break;
      case QuickButtonType.edit:
        backgroundColor = Colors.blue;
        break;
      case QuickButtonType.done:
        backgroundColor = Colors.green;
        break;
    }

    switch (type) {
      case QuickButtonType.achieve:
        icon = Assets.archive;
        break;
      case QuickButtonType.edit:
        icon = Assets.pencil;
        break;
      case QuickButtonType.done:
        icon = Assets.tick;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: QuickButtonType.done == type && isCompleted
              ? backgroundColor
              : backgroundColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(AppConsts.rSmall),
          border: Border.all(
            width: 1,
            color: backgroundColor,
          ),
        ),
        alignment: Alignment.center,
        child: SvgBuild(
          assetImage: icon,
          colorFilter: ColorFilter.mode(
            QuickButtonType.done == type && isCompleted
                ? context.onPrimary
                : backgroundColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
