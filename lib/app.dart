import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        return MaterialApp(
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: RoutePaths.settings,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(seedColor: Color(snapshot.seek), brightness: Brightness.light),
          ),
          darkTheme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(seedColor: Color(snapshot.seek), brightness: Brightness.dark),
          ),
          themeMode: snapshot.isResponsiveTheme
              ? ThemeMode.system
              : snapshot.isDarkMode
                  ? ThemeMode.dark
                  : ThemeMode.light,
          locale: !snapshot.isResponsiveLanguage ? Locale(snapshot.languageCode) : null,
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
