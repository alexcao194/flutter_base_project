import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/settings_snapshot.freezed.dart';

@freezed
class SettingsSnapshot with _$SettingsSnapshot {
  const factory SettingsSnapshot({
    required String languageCode,
    required bool isResponsiveLanguage,
    required int seek,
    required bool isDarkMode,
    required bool isResponsiveTheme,
  }) = _SettingsSnapshot;
}