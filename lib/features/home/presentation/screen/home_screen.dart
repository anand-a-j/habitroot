import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/constants/app_constants.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/features/home/presentation/widgets/habit_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: HabitListView(),
      //  Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
      //   child: Column(
      //     children: [

      //       Padding(
      //         padding: const EdgeInsets.symmetric(vertical: AppConsts.pMedium),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text(
      //               "",
      //               style: context.bodyMedium,
      //             ),
      //             Text(
      //               "",
      //               style: context.bodySmall?.copyWith(color: context.primary),
      //             ),
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goNamed('add-category-screen'),
        child: Icon(Icons.add),
      ),
    );
  }
}
