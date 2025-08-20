import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habitroot/core/constants/constants.dart';
import 'package:habitroot/core/extension/common.dart';

class GeneralCard extends StatelessWidget {
  final String title;
  final String? subTitle;
  final void Function()? onTap;
  final bool isFirst;
  final bool isLast;
  final Widget? trailing;

  const GeneralCard({
    super.key,
    required this.title,
    this.subTitle,
    this.onTap,
    this.isFirst = false,
    this.isLast = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    double defaultRadius = 4;
    double largeRadius = 15;

    final borderRadius = BorderRadius.vertical(
      top: Radius.circular(isFirst ? largeRadius : defaultRadius),
      bottom: Radius.circular(isLast ? largeRadius : defaultRadius),
    );
    return Card(
      margin: const EdgeInsets.only(bottom: 2),
      color: context.secondaryFixed,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          // leading: SvgPicture.asset(
          //   leadingIcon,
          //   width: 24,
          //   height: 24,
          //   fit: BoxFit.contain,
          //   colorFilter: ColorFilter.mode(
          //     context.onPrimary.withValues(alpha: 0.5),
          //     BlendMode.srcIn,
          //   ),
          // ),
          title: Text(
            title,
            style: context.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: subTitle != null
              ? Text(
                  subTitle!,
                  style: context.bodyMedium,
                )
              : null,
          trailing: trailing,
        ),
      ),
    );
  }
}
