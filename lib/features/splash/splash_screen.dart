import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:habitroot/core/components/svg_build.dart';
import 'package:habitroot/core/constants/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.goNamed('dashboard-screen');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Hero(
          tag: 'app-logo-hero-tag',
          child: SvgBuild(
            assetImage: Assets.habitRoot,
          ),
        ),
      ),
    );
  }
}
