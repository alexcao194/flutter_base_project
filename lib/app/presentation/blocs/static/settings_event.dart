part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.getSettings() = _GetSettings;
  const factory SettingsEvent.changeColorSeek(int seek) = _ChangeColorSeek;
  const factory SettingsEvent.changeLocale(String languageCode) = _ChangeLanguage;
  const factory SettingsEvent.setResponsiveLanguage(bool isResponsiveLanguage) = _SetResponsiveLanguage;
  const factory SettingsEvent.changeTheme(bool isDarkMode) = _ChangeTheme;
  const factory SettingsEvent.setResponsiveTheme(bool isResponsiveTheme) = _SetResponsiveTheme;
}
