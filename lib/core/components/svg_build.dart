import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgBuild extends StatelessWidget {
  const SvgBuild({
    super.key,
    required this.assetImage,
    this.height,
    this.width,
    this.colorFilter,
  });

  final String assetImage;
  final double? height;
  final double? width;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetImage,
      height: height,
      width: width,
      colorFilter: colorFilter,
      errorBuilder: (context, error, stackTrace) {
        return const SizedBox.shrink();
      },
    );
  }
}
