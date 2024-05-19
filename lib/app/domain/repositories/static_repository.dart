import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import '../entities/settings_snapshot.dart';

abstract interface class StaticRepository {
  Future<Either<Failure, void>> saveSettingsSnapshot(SettingsSnapshot settingsSnapshot);

  Either<Failure, SettingsSnapshot> getSettingsSnapshot();
}
