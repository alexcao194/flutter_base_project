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
    @HiveField(0)
    required String languageCode,
    @HiveField(1)
    required bool isResponsiveLanguage,
    @HiveField(2)
    required int seek,
    @HiveField(3)
    required bool isDarkMode,
    @HiveField(4)
    required bool isResponsiveTheme,
  }) = _SettingsSnapshotModel;

  factory SettingsSnapshotModel.fromEntity(SettingsSnapshot entity) =>
      SettingsSnapshotModel(
        languageCode: entity.languageCode,
        isResponsiveLanguage: entity.isResponsiveLanguage,
        seek: entity.seek,
        isDarkMode: entity.isDarkMode,
        isResponsiveTheme: entity.isResponsiveTheme,
      );

  factory SettingsSnapshotModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsSnapshotModelFromJson(json);
}

extension SettingsSnapshotModelX on SettingsSnapshotModel {
  SettingsSnapshot toEntity()  {
    return SettingsSnapshot(
      languageCode: languageCode,
      isResponsiveLanguage: isResponsiveLanguage,
      seek: seek,
      isDarkMode: isDarkMode,
      isResponsiveTheme: isResponsiveTheme,
    );
  }
}