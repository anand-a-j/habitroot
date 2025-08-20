import 'package:flutter/material.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/core/extension/theme_mode.dart';
import 'package:habitroot/routes/routes.dart';

import '../../../../core/components/svg_build.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/assets.dart';

void showThemeBottomSheet(BuildContext context) {
  showModalBottomSheet<ThemeMode>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: context.secondaryFixed,
    isScrollControlled: true,
    builder: (context) => const ThemeBottomSheet(),
  );
}

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  ValueNotifier<ThemeMode> _currentIndex = ValueNotifier(
    ThemeMode.values[settings.get(themeModeKey, defaultValue: 0)],
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConsts.pSide),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10,
            children: [
              SvgBuild(
                assetImage: Assets.arrowLeft,
                colorFilter: ColorFilter.mode(
                  context.onPrimary,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                "Theme",
                style: context.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Column(
            mainAxisSize: MainAxisSize.min,
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

                      Navigator.pop(context);
                    },
                  );
                },
              );
            }),
          ),
        ],
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
        margin: const EdgeInsets.only(bottom: AppConsts.pSmall),
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
            color: context.secondary,
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
