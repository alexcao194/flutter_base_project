import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_types.dart';
import '../../domain/entity/settings_snapshot.dart';

part 'generated/settings_snapshot_model.freezed.dart';

part 'generated/settings_snapshot_model.g.dart';

@freezed
@HiveType(typeId: HiveTypes.settingsSnapshot)
class SettingsSnapshotModel with _$SettingsSnapshotModel {
  const factory SettingsSnapshotModel({
    @HiveField(0) @Default(null) String? languageCode,
    @HiveField(1) @Default(0X0A75AD) int seek,
    @HiveField(2) @Default(0) int themeMode,
  }) = _SettingsSnapshotModel;

  factory SettingsSnapshotModel.fromEntity(SettingsSnapshot entity) => SettingsSnapshotModel(
        languageCode: entity.languageCode,
        seek: entity.seek,
        themeMode: entity.themeMode,
      );

  factory SettingsSnapshotModel.fromJson(Map<String, dynamic> json) => _$SettingsSnapshotModelFromJson(json);
}

extension SettingsSnapshotModelX on SettingsSnapshotModel {
  SettingsSnapshot toEntity() {
    return SettingsSnapshot(
      languageCode: languageCode,
      seek: seek,
      themeMode: themeMode,
    );
  }
}
