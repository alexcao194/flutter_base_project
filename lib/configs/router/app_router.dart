import 'package:base/app/presentation/settings/settings_screen.dart';
import 'package:flutter/material.dart';

part 'route_paths.dart';

class AppRouter {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.settings:
        return MaterialPageRoute<void>(
          builder: (_) => const SettingsScreen(),
        );
      default:
        return MaterialPageRoute<void>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
