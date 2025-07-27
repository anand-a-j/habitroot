import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/components/core_components.dart';
import 'package:habitroot/core/constants/app_constants.dart';
import 'package:habitroot/features/settings/presentation/widgets/reorder_card.dart';

import '../../../../core/constants/strings.dart';
import '../../../habit/domain/habit.dart';
import '../../../habit/presentation/provider/habit_provider.dart';

class ReorderScreen extends ConsumerStatefulWidget {
  const ReorderScreen({super.key});
  @override
  ConsumerState<ReorderScreen> createState() => _ReorderScreenState();
}

class _ReorderScreenState extends ConsumerState<ReorderScreen> {
  late List<Habit> _localHabits;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // initialize from Riverpod
    final providerMap = ref.read(habitProvider);
    _localHabits = providerMap.values.where((h) => !h.isArchived).toList()
      ..sort((a, b) => a.order.compareTo(b.order));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HabitRootAppBar(
        leadingOnTap: () => context.pop(),
        title: reorderHabitsEn,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
        child: _localHabits.isEmpty
            ? const Center(child: Text('No habits found.'))
            : ReorderableListView(
                onReorder: (oldIndex, newIndex) {
    
                  if (newIndex > oldIndex) newIndex -= 1;
                  final moved = _localHabits.removeAt(oldIndex);
                  _localHabits.insert(newIndex, moved);
                  setState(() {});

                  ref.read(habitProvider.notifier).reorderHabits(
                        _localHabits,
                        oldIndex,
                        newIndex,
                      );
                },
                proxyDecorator: (child, index, animation) => Material(
                  type: MaterialType.transparency,
                  child: child,
                ),
                children: [
                  for (final habit in _localHabits)
                    ReorderCard(key: ValueKey(habit.id), habit: habit),
                ],
              ),
      ),
    );
  }
}
