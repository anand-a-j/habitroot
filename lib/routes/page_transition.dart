import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FadeTransitionPage extends CustomTransitionPage {
  final Widget page;

  FadeTransitionPage({required this.page})
      : super(
          child: page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const curve = Curves.easeInOutBack;
            var curveTween = CurveTween(curve: curve);

            var fadeAnimation = animation.drive(curveTween);

            return FadeTransition(
              opacity: fadeAnimation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
        );
}

class SlideTransitionPage extends CustomTransitionPage {
  final Widget page;
  final Offset beginOffset;

  SlideTransitionPage({
    required this.page,
    required this.beginOffset,
    Duration duration = const Duration(milliseconds: 300),
  }) : super(
          child: page,
          transitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween<Offset>(begin: beginOffset, end: Offset.zero)
                .chain(CurveTween(curve: Curves.easeInOut));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}
