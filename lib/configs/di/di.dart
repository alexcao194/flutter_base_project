import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/data/data_sources/local_data.dart';
import '../../app/data/repositories/local_repository_impl.dart';
import '../../app/domain/repositories/local_repository.dart';
import '../../app/domain/use_cases/get_settings.dart';
import '../../app/domain/use_cases/save_settings.dart';
import '../../app/presentation/bloc/settings_bloc.dart';
import '../../utils/tools/device_info_tools.dart';
import '../dio/app_dio.dart';
import '../hive/hive_tools.dart';

class DI {
  static DI? _instance;

  DI._();

  factory DI() {
    _instance ??= DI._();
    return _instance!;
  }

  final sl = GetIt.instance;

  Future<void> init() async {
    // Bloc
    sl.registerFactory<SettingsBloc>(
      () => SettingsBloc(
        getSettings: sl(),
        saveSettings: sl(),
      ),
    );

    // UseCase
    sl.registerLazySingleton<GetSettings>(
      () => GetSettings(
        localRepository: sl(),
      ),
    );

    sl.registerLazySingleton<SaveSettings>(
      () => SaveSettings(
        localRepository: sl(),
      ),
    );

    // Repository
    sl.registerLazySingleton<LocalRepository>(
      () => LocalRepositoryImpl(localData: sl()),
    );

    // DataSource
    sl.registerLazySingleton<LocalData>(
      () => LocalDataImpl(
        hiveTools: sl(),
        sharedPreferences: sl(),
      ),
    );

    // Service
    final sharedPrefs = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

    sl.registerLazySingleton<DeviceInfoTools>(() => DeviceInfoTools());

    sl.registerLazySingleton<AppDio>(() => AppDio());
    sl.registerLazySingleton<Dio>(() => sl<AppDio>().dio);

    final hiveTools = HiveTools();
    await hiveTools.init();
    sl.registerLazySingleton<HiveTools>(() => hiveTools);
  }
}
