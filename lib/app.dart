import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constants/language_codes.dart';
import 'app/presentation/screen/settings/bloc/settings_bloc.dart';
import 'configs/router/app_router.dart';
import 'generated/l10n.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        var snapshot = state.settingsSnapshot;
        var languageCode = LanguageCodes.fromCode(snapshot.languageCode).code;
        debugPrint('snapshot: $snapshot');
        return MaterialApp(
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: RoutePaths.home,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(seedColor: Color(snapshot.seek), brightness: Brightness.light),
          ),
          darkTheme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(seedColor: Color(snapshot.seek), brightness: Brightness.dark),
          ),
          themeMode: ThemeMode.values[snapshot.themeMode],
          locale: languageCode == null ? null : Locale(languageCode),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        );
      },
    );
  }
}
