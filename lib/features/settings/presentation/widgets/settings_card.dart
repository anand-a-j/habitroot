import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habitroot/core/constants/constants.dart';
import 'package:habitroot/core/extension/common.dart';

class SettingsCard extends StatelessWidget {
  final String leadingIcon;
  final String title;
  final String? subTitle;
  final void Function()? onTap;

  const SettingsCard({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.subTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsetsDirectional.only(
          start: 10,
          end: 5,
          top: 12,
          bottom: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppConsts.rSmall,
          ),
          color: context.secondaryContainer,
        ),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                leadingIcon,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
                colorFilter: ColorFilter.mode(
                  context.onPrimary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: context.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 4,
                bottom: 4,
                end: 10,
              ),
              child: SvgPicture.asset(
                Assets.arrowRight,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
                colorFilter: ColorFilter.mode(
                  context.onPrimary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
