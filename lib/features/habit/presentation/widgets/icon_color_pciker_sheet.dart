import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:habitroot/core/components/svg_build.dart';
import 'package:habitroot/core/constants/constants.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/core/theme/app_color_scheme.dart';
import 'package:habitroot/core/utils/string_utils.dart';

Future<int> showColorPicker(
  BuildContext context, {
  required int initialColor,
}) async {
  final selectedColor = await showModalBottomSheet<int>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: AppColorScheme.secondaryContainer,
    isScrollControlled: true,
    builder: (context) => _IconColorPickerBody(initialColor: initialColor),
  );

  log("selected color ${selectedColor}");

  return selectedColor ?? AppColorScheme.habitColorOptions.first.value;
}

class _IconColorPickerBody extends StatefulWidget {
  final int initialColor;

  const _IconColorPickerBody({required this.initialColor});

  @override
  State<_IconColorPickerBody> createState() => _IconColorPickerBodyState();
}

class _IconColorPickerBodyState extends State<_IconColorPickerBody> {
  late int selectedColor;

  @override
  void initState() {
    super.initState();
    selectedColor = widget.initialColor;
  }

  void _selectColor(int color) {
    setState(() {
      selectedColor = color;
    });

    Navigator.pop(context, selectedColor);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 20,
        start: AppConsts.pSide,
        end: AppConsts.pSide,
        bottom: 30,
      ),
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
                "Color",
                style: context.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 0,
            runSpacing: 0,
            children: List.generate(
              AppColorScheme.habitColorOptions.length,
              (index) {
                final color = AppColorScheme.habitColorOptions[index];

                final colorHexString = color.value;

                final isSelected = selectedColor == colorHexString;

                return GestureDetector(
                  onTap: () => _selectColor(colorHexString),
                  child: Container(
                    height: 40,
                    width: 40,
                    margin:
                        const EdgeInsetsDirectional.only(end: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppConsts.rMicro),
                      color: color,
                      border: isSelected
                          ? Border.all(color: context.onPrimary, width: 1.2)
                          : null,
                    ),
                    child: isSelected
                        ? const Center(child: SvgBuild(assetImage: Assets.tick))
                        : null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
