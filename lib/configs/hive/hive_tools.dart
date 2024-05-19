import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../app/data/models/settings_snapshot_model.dart';

class HiveTools {
  static const String _settingsSnapshotKey = 'settings_snapshot';

  Box<SettingsSnapshotModel> get settingsSnapshotBox => Hive.box<SettingsSnapshotModel>(_settingsSnapshotKey);

  init() async {
    if (kIsWeb) {
      await Hive.initFlutter();
    } else {
      final dir = await getApplicationDocumentsDirectory();
      await Hive.initFlutter(dir.path);
    }

    Hive.registerAdapter(SettingsSnapshotModelAdapter());

    await Hive.openBox<SettingsSnapshotModel>(_settingsSnapshotKey);
  }
}
