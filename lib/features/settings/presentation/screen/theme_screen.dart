import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/components/svg_build.dart';
import 'package:habitroot/core/constants/assets.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/core/extension/theme_mode.dart';

import '../../../../core/components/habitroot_appbar.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../routes/routes.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  ValueNotifier<ThemeMode> _currentIndex = ValueNotifier(
    ThemeMode.values[settings.get(themeModeKey, defaultValue: 0)],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HabitRootAppBar(
        leadingOnTap: () => context.pop(),
        title: "Theme",
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConsts.pSide),
        children: List.generate(ThemeMode.values.length, (index) {
          return ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, value, child) {
                return _ThemeButton(
                  title: ThemeMode.values[index].stringValue,
                  isSelected: value == ThemeMode.values[index],
                  onTap: () {
                    _currentIndex.value = ThemeMode.values[index];
                    settings.put(themeModeKey, _currentIndex.value.index);
                  },
                );
              });
        }),
      ),
    );
  }
}

class _ThemeButton extends StatelessWidget {
  const _ThemeButton({
    required this.title,
    required this.isSelected,
    this.onTap,
  });

  final String title;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppConsts.pMedium),
        padding: const EdgeInsetsDirectional.only(
          start: 10,
          end: 10,
          top: 12,
          bottom: 12,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppConsts.rSmall,
            ),
            color: context.secondaryFixed,
            border: Border.all(
              width: 1,
              color: isSelected ? context.onPrimary : Colors.transparent,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: context.bodyLarge?.copyWith(
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
            if (isSelected)
              SvgBuild(
                assetImage: Assets.tick,
              )
          ],
        ),
      ),
    );
  }
}
