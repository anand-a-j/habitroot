import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/core/theme/app_color_scheme.dart';

import '../constants/app_constants.dart';
import '../constants/assets.dart';

class HabitRootAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final Color backgroundColor;
  final List<Widget>? actions;
  final void Function()? leadingOnTap;
  final PreferredSizeWidget? bottom;
  final bool isAnimate;
  final bool isTabContain;
  final bool isSmallWidth;

  const HabitRootAppBar({
    super.key,
    this.title,
    this.leadingOnTap,
    this.actions,
    this.backgroundColor = AppColorScheme.scaffoldBackgroundColor,
    this.bottom,
    this.isAnimate = false,
    this.isTabContain = false,
    this.isSmallWidth = false,
  });

  @override
  _HabitRootAppBarState createState() => _HabitRootAppBarState();

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (isTabContain ? 46 : 0));
}

class _HabitRootAppBarState extends State<HabitRootAppBar>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset>? _offsetAnimation;

  @override
  void initState() {
    super.initState();

    if (widget.isAnimate) {
      _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      );

      _offsetAnimation = Tween<Offset>(
        begin: const Offset(0.0, -1.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeOut,
      ));

      _animationController!.forward();
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isAnimate
        ? SlideTransition(
            position: _offsetAnimation!,
            child: _AppBar(
              widget: widget,
              isSmallWidth: widget.isSmallWidth,
            ),
          )
        : _AppBar(
            widget: widget,
            isSmallWidth: widget.isSmallWidth,
          );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    required this.widget,
    required this.isSmallWidth,
  });

  final HabitRootAppBar widget;
  final bool isSmallWidth;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      backgroundColor: widget.backgroundColor,
      centerTitle: false,
      leading: widget.leadingOnTap != null
          ? GestureDetector(
              onTap: widget.leadingOnTap,
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 10,
                  bottom: 10,
                  start: isSmallWidth ? AppConsts.pSmall : 20,
                ),
                child: SvgPicture.asset(
                  Assets.arrowLeft,
                  height: 12,
                  width: 12,
                ),
              ),
            )
          : null,
      title: widget.title != null
          ? Padding(
              padding: EdgeInsetsDirectional.only(
                start: widget.leadingOnTap != null
                    ? isSmallWidth
                        ? 5
                        : 10
                    : isSmallWidth
                        ? AppConsts.pSmall
                        : 20,
              ),
              child: Text(
                widget.title!,
                style: context.titleMedium,
              ),
            )
          : null,
      actions: widget.actions,
      bottom: widget.bottom,
    );
  }
}
