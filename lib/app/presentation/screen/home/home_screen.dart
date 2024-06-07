import 'package:flutter/material.dart';

import '../../../../configs/router/app_router.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/extensions/context_extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.app_name),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              _openSettingsScreen(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(S.current.app_name),
      ),
    );
  }

  void _openSettingsScreen(BuildContext context) {
    context.navigator.pushNamed(RoutePaths.settings);
  }
}
