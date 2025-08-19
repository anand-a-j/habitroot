import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/components/habitroot_appbar.dart';
import '../../../../core/constants/app_constants.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HabitRootAppBar(
        leadingOnTap: () => context.pop(),
        title: "General",
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: AppConsts.pLarge),
            
          ],
        ),
      ),
    );
  }
}
