import 'package:habitroot/core/enum/box_types.dart';
import 'package:habitroot/features/notification/domain/reminder.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/habit/domain/habit.dart';

class HiveService {
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(HabitAdapter());
    }

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ReminderAdapter());
    }

    await Hive.openBox<Habit>(BoxType.habit.name);
    await Hive.openBox<dynamic>(BoxType.settings.name);
  }
}
