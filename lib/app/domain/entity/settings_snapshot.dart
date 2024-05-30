import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../constants/language_codes.dart';

part 'generated/settings_snapshot.freezed.dart';

@freezed
class SettingsSnapshot with _$SettingsSnapshot {
  const factory SettingsSnapshot({
    @Default(LanguageCodes.english) String languageCode,
    @Default(true) bool isResponsiveLanguage,
    @Default(0X0A75AD) int seek,
    @Default(false) bool isDarkMode,
    @Default(true) bool isResponsiveTheme,
  }) = _SettingsSnapshot;
}