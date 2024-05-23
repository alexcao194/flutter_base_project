part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(0X0A75AD) int seek,
    @Default(LanguageCodes.english) String languageCode,
    @Default(true) bool isResponsiveLanguage,
    @Default(false) bool isDarkMode,
    @Default(true) bool isResponsiveTheme,
  }) = _SettingsState;
}
