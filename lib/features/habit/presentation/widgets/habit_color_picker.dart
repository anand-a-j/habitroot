import 'package:flutter/material.dart';
import 'package:habitroot/core/components/svg_build.dart';
import 'package:habitroot/core/constants/constants.dart';
import 'package:habitroot/core/theme/app_color_scheme.dart';
import 'package:habitroot/core/utils/string_utils.dart';

class HabitColorPicker extends StatefulWidget {
  const HabitColorPicker({
    super.key,
    required this.onColorSelected,
    this.initialColorString,
  });

  final ValueChanged<String> onColorSelected;
  final String? initialColorString;

  @override
  State<HabitColorPicker> createState() => _HabitColorPickerState();
}

class _HabitColorPickerState extends State<HabitColorPicker>
    with AppColorScheme {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // If an initial color is passed, find its index
    if (widget.initialColorString != null) {
      final index = AppColorScheme.habitColorOptions.indexWhere(
        (color) =>
            StringUtils.colorToDartConst(color).toUpperCase() ==
            widget.initialColorString!.toUpperCase(),
      );
      if (index != -1) {
        selectedIndex = index;
      }
    }

     // Trigger initial color selection callback
    widget.onColorSelected(
      StringUtils.colorToDartConst(
        AppColorScheme.habitColorOptions[selectedIndex],
      ),
    );
  }
    

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: AppColorScheme.habitColorOptions.length,
        itemBuilder: (context, index) {
          final color = AppColorScheme.habitColorOptions[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onColorSelected(
                StringUtils.colorToDartConst(color),
              );
            },
            child: _ColorCard(
              color: color,
              isSelected: index == selectedIndex,
            ),
          );
        },
      ),
    );
  }
}

class _ColorCard extends StatelessWidget {
  const _ColorCard({required this.color, required this.isSelected});

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: const EdgeInsetsDirectional.only(end: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConsts.rMicro),
        color: color,
        border: isSelected ? Border.all(color: Colors.white, width: 2) : null,
      ),
      child: isSelected
          ? const Center(
              child: SvgBuild(assetImage: Assets.tick),
            )
          : null,
    );
  }
}
