part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.getSettings() = _GetSettings;
  const factory SettingsEvent.changeColorSeek(int seek) = _ChangeColorSeek;
  const factory SettingsEvent.changeLocale(String? languageCode) = _ChangeLanguage;
  const factory SettingsEvent.changeTheme(int themeMode) = _ChangeTheme;
}
