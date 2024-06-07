import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/language_codes.dart';
import '../../../../generated/l10n.dart';
import 'bloc/settings_bloc.dart';
import '../../../../utils/extensions/context_extensions.dart';
import '../../../../utils/extensions/theme_mode_extensions.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final seeks = [
      Colors.green,
      Colors.blue,
      Colors.purple,
      Colors.pink,
      Colors.teal,
      Colors.indigo,
      Colors.cyan,
      Colors.amber,
      Colors.red,
    ];

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        final snapshot = state.settingsSnapshot;
        return Scaffold(
          appBar: AppBar(
            title: Text(S.current.settings),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: context.height * 0.2,
                  width: context.height * 0.2,
                  decoration: BoxDecoration(color: context.colorScheme.primary, borderRadius: BorderRadius.circular(10)),
                ),
              ),
              // color picker
              SizedBox(
                height: context.height * 0.1,
                child: ListView.builder(
                  itemCount: seeks.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.read<SettingsBloc>().add(SettingsEvent.changeColorSeek(seeks[index].value));
                      },
                      child: Container(
                        height: context.height * 0.1,
                        width: context.height * 0.1,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: ColorScheme.fromSeed(
                            seedColor: seeks[index],
                            brightness: context.theme.brightness,
                          ).primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.current.theme, style: context.textTheme.titleMedium),
              ),
              RadioListTile<int>(
                title: Text(S.current.light_mode),
                value: ThemeMode.light.value,
                groupValue: snapshot.themeMode,
                onChanged: _onChangeTheme,
              ),
              RadioListTile<int>(
                title: Text(S.current.dark_mode),
                value: ThemeMode.dark.value,
                groupValue: snapshot.themeMode,
                onChanged: _onChangeTheme,
              ),
              RadioListTile<int>(
                title: Text(S.current.system),
                value: ThemeMode.system.value,
                groupValue: snapshot.themeMode,
                onChanged: _onChangeTheme,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.current.language, style: context.textTheme.titleMedium),
              ),
              RadioListTile<String?>(
                title: Text(S.current.vietnamese),
                value: LanguageCodes.vietnamese.code,
                groupValue: snapshot.languageCode,
                onChanged: _onChangeLanguage,
              ),
              RadioListTile<String?>(
                title: Text(S.current.english),
                value: LanguageCodes.english.code,
                groupValue: snapshot.languageCode,
                onChanged: _onChangeLanguage,
              ),
              RadioListTile<String?>(
                title: Text(S.current.system),
                value: LanguageCodes.system.code,
                groupValue: snapshot.languageCode,
                onChanged: _onChangeLanguage,
              ),
            ],
          ),
        );
      },
    );
  }

  void _onChangeTheme(int? value) {
    if (value == null) {
      return;
    }
    context.read<SettingsBloc>().add(SettingsEvent.changeTheme(value));
  }

  void _onChangeLanguage(String? value) {
    context.read<SettingsBloc>().add(SettingsEvent.changeLocale(value));
  }
}
