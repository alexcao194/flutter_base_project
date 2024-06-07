import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/use_case/unit.dart';
import '../../../../domain/entity/settings_snapshot.dart';
import '../../../../domain/use_case/get_settings.dart';
import '../../../../domain/use_case/save_settings.dart';

part 'settings_event.dart';

part 'settings_state.dart';

part 'generated/settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  late final GetSettings _getSettings;
  late final SaveSettings _saveSettings;

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
        changeTheme: (event) => _onChangeTheme(event, emit),
      );
    });

    add(const SettingsEvent.getSettings());
  }

  _onChangeColorSeek(_ChangeColorSeek event, Emitter<SettingsState> emit) {
    emit(state.copyWith(settingsSnapshot: state.settingsSnapshot.copyWith(seek: event.seek)));
    _saveSettings(state.settingsSnapshot);
  }

  _onChangeLocale(_ChangeLanguage event, Emitter<SettingsState> emit) {
    emit(state.copyWith(settingsSnapshot: state.settingsSnapshot.copyWith(languageCode: event.languageCode)));
    _saveSettings(state.settingsSnapshot);
  }

  _onGetSettings(_GetSettings event, Emitter<SettingsState> emit) {
    var result = _getSettings(Unit);
    result.fold(
      (failure) => null,
      (settingsSnapshot) => emit(state.copyWith(settingsSnapshot: settingsSnapshot)),
    );
  }

  _onChangeTheme(_ChangeTheme event, Emitter<SettingsState> emit) {
    emit(state.copyWith(settingsSnapshot: state.settingsSnapshot.copyWith(themeMode: event.themeMode)));
    _saveSettings(state.settingsSnapshot);
  }
}
