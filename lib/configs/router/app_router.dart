import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../app/presentation/settings/settings_screen.dart';

part 'route_paths.dart';

class AppRouter {
  const AppRouter._();

  static final router = GoRouter(
    initialLocation: RoutePaths.join,
    redirect: (_, state) {
      return null;
    },
    routes: [
      GoRoute(
        path: RoutePaths.join,
        pageBuilder: (context, state) => buildCustomTransitionPage(
          child: const SettingsScreen(),
          context: context,
          state: state,
        ),
      ),
    ],
  );
}

CustomTransitionPage buildCustomTransitionPage<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
