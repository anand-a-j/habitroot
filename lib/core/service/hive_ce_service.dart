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

   await Hive.openBox<Habit>('habits');

  }
}
