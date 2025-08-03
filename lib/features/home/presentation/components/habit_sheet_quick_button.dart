// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:habitroot/core/components/core_components.dart';
import 'package:habitroot/core/constants/constants.dart';
import 'package:habitroot/core/extension/color_extension.dart';


class HabitSheetQuickButton extends StatelessWidget {
  final String icon;
  void Function()? onTap;

  HabitSheetQuickButton({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 35,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: context.secondary,
          borderRadius: BorderRadius.circular(AppConsts.rMicro),
          border: Border.all(
            width: 1,
            color: context.onSecondaryContainer,
          ),
        ),
        alignment: Alignment.center,
        child: SvgBuild(
          assetImage: icon,
          height: 24,
          width: 24,
          colorFilter: ColorFilter.mode(
            context.onPrimary.withValues(alpha: 0.5),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
