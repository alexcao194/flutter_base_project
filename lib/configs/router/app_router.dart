import 'package:flutter/material.dart';

import '../../app/presentation/screen/home/home_screen.dart';
import '../../app/presentation/screen/settings/settings_screen.dart';

part 'route_paths.dart';

class AppRouter {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.settings:
        return MaterialPageRoute<void>(
          builder: (_) => const SettingsScreen(),
        );
      case RoutePaths.home:
        return MaterialPageRoute<void>(
          builder: (_) => const HomeScreen(),
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
