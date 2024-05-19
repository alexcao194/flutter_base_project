import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app.dart';
import 'app/presentation/blocs/settings/settings_bloc.dart';
import 'configs/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DI().init();

  // if the app is running on the web, set the URL strategy (remove the # from the URL)
  if (kIsWeb) {
    setPathUrlStrategy();
  }

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DI().sl<SettingsBloc>()),
      ],
      child: const App(),
    ),
  );
}
