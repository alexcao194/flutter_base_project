import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../constants/language_codes.dart';
import '../../../../core/use_case/unit.dart';
import '../../../domain/entities/settings_snapshot.dart';
import '../../../domain/use_cases/get_settings.dart';
import '../../../domain/use_cases/save_settings.dart';

part 'settings_event.dart';

part 'settings_state.dart';

part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  late final GetSettings _getSettings;
  late final SaveSettings _saveSettings;

  late SettingsSnapshot _settingsSnapshot;

  SettingsBloc({
    required GetSettings getSettings,
    required SaveSettings saveSettings,
  }) : super(const SettingsState()) {
    _getSettings = getSettings;
    _saveSettings = saveSettings;
    on<SettingsEvent>((event, emit) async {
      await event.map(
        getSettings: (event) => _onGetSettings(event, emit),
        changeColorSeek: (event) => _onChangeColorSeek(event, emit),
        changeLocale: (event) => _onChangeLocale(event, emit),
        setResponsiveLanguage: (event) => _setResponsiveLanguage(event, emit),
        changeTheme: (event) => _onChangeTheme(event, emit),
        setResponsiveTheme: (event) => _onSetResponsiveTheme(event, emit),
      );
    });

    add(const SettingsEvent.getSettings());
  }

  _onChangeColorSeek(_ChangeColorSeek event, Emitter<SettingsState> emit) {
    emit(state.copyWith(seek: event.seek));
    _settingsSnapshot = _settingsSnapshot.copyWith(seek: event.seek);
    _saveSettings(_settingsSnapshot);
  }

  _onChangeLocale(_ChangeLanguage event, Emitter<SettingsState> emit) {
    emit(state.copyWith(languageCode: event.languageCode));
    _settingsSnapshot = _settingsSnapshot.copyWith(languageCode: event.languageCode);
    _saveSettings(_settingsSnapshot);
  }

  _setResponsiveLanguage(_SetResponsiveLanguage event, Emitter<SettingsState> emit) {
    emit(state.copyWith(isResponsiveLanguage: event.isResponsiveLanguage));
    _settingsSnapshot = _settingsSnapshot.copyWith(isResponsiveLanguage: event.isResponsiveLanguage);
    _saveSettings(_settingsSnapshot);
  }

  _onGetSettings(_GetSettings event, Emitter<SettingsState> emit) {
    var result = _getSettings(Unit);
    result.fold(
      (failure) => _settingsSnapshot = const SettingsSnapshot(
        languageCode: LanguageCodes.english,
        isResponsiveLanguage: true,
        seek: 0,
        isDarkMode: false,
        isResponsiveTheme: true,
      ),
      (settingsSnapshot) {
        _settingsSnapshot = settingsSnapshot;
        emit(
          state.copyWith(
            languageCode: settingsSnapshot.languageCode,
            isResponsiveLanguage: settingsSnapshot.isResponsiveLanguage,
            seek: settingsSnapshot.seek,
            isDarkMode: settingsSnapshot.isDarkMode,
            isResponsiveTheme: settingsSnapshot.isResponsiveTheme,
          ),
        );
      },
    );
  }

  _onChangeTheme(_ChangeTheme event, Emitter<SettingsState> emit) {
    emit(state.copyWith(isDarkMode: event.isDarkMode));
    _settingsSnapshot = _settingsSnapshot.copyWith(isDarkMode: event.isDarkMode);
    _saveSettings(_settingsSnapshot);
  }

  _onSetResponsiveTheme(_SetResponsiveTheme event, Emitter<SettingsState> emit) {
    emit(state.copyWith(isResponsiveTheme: event.isResponsiveTheme));
    _settingsSnapshot = _settingsSnapshot.copyWith(isResponsiveTheme: event.isResponsiveTheme);
    _saveSettings(_settingsSnapshot);
  }
}
