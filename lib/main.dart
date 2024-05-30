import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'app/presentation/screen/settings/bloc/settings_bloc.dart';
import 'configs/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DI().init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DI().sl<SettingsBloc>()),
      ],
      child: const App(),
    ),
  );
}
