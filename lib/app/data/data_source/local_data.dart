import 'package:shared_preferences/shared_preferences.dart';

import '../../../configs/hive/hive_tools.dart';
import '../model/settings_snapshot_model.dart';

abstract interface class LocalData {
  Future<void> saveSettingsSnapshot(SettingsSnapshotModel settingsSnapshot);

  SettingsSnapshotModel getSettingsSnapshot();
}

class LocalDataImpl implements LocalData {
  final SharedPreferences _sharedPreferences;
  final HiveTools _hiveTools;

  const LocalDataImpl({
    required HiveTools hiveTools,
    required SharedPreferences sharedPreferences,
  })  : _hiveTools = hiveTools,
        _sharedPreferences = sharedPreferences;

  static const String _settingsSnapshotKey = 'settings_snapshot';

  @override
  Future<void> saveSettingsSnapshot(SettingsSnapshotModel settingsSnapshot) {
    final settingsSnapshotBox = _hiveTools.settingsSnapshotBox;
    return settingsSnapshotBox.put(_settingsSnapshotKey, settingsSnapshot);
  }

  @override
  SettingsSnapshotModel getSettingsSnapshot() {
    final settingsSnapshotBox = _hiveTools.settingsSnapshotBox;
    final result = settingsSnapshotBox.get(_settingsSnapshotKey);
    if (result == null) {
      throw Exception('SettingsSnapshot not found');
    }
    return result;
  }
}
