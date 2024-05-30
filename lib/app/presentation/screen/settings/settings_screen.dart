import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/language_codes.dart';
import '../../../../generated/l10n.dart';
import 'bloc/settings_bloc.dart';
import '../../../../utils/extensions/context_extensions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
      Colors.lime,
    ];

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        final snapshot = state.settingsSnapshot;
        return Scaffold(
          appBar: AppBar(
            title: Text(S.current.app_name),
          ),
          body: Column(
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
                        decoration: BoxDecoration(color: seeks[index], borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S.current.theme_by_system),
                  Switch(
                    value: snapshot.isResponsiveTheme,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(SettingsEvent.setResponsiveTheme(value));
                    },
                  ),
                  Text(S.current.dark_mode),
                  Switch(
                    value: snapshot.isDarkMode,
                    onChanged: snapshot.isResponsiveTheme
                        ? null
                        : (value) {
                            context.read<SettingsBloc>().add(SettingsEvent.changeTheme(value));
                          },
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S.current.language_by_system),
                  Switch(
                    value: snapshot.isResponsiveLanguage,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(SettingsEvent.setResponsiveLanguage(value));
                    },
                  ),
                  Text(S.current.english),
                  Switch(
                    value: snapshot.languageCode == LanguageCodes.english,
                    onChanged: snapshot.isResponsiveLanguage
                        ? null
                        : (value) {
                            context.read<SettingsBloc>().add(
                                  SettingsEvent.changeLocale(
                                    value ? LanguageCodes.english : LanguageCodes.vietnamese,
                                  ),
                                );
                          },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
