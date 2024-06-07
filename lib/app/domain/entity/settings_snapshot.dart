import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/settings_snapshot.freezed.dart';

@freezed
class SettingsSnapshot with _$SettingsSnapshot {
  const factory SettingsSnapshot({
    @Default(null) String? languageCode,
    @Default(0X0A75AD) int seek,
    @Default(0) int themeMode,
  }) = _SettingsSnapshot;
}