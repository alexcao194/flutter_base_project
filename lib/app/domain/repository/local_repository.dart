import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import '../entity/settings_snapshot.dart';

abstract interface class LocalRepository {
  Future<Either<Failure, void>> saveSettingsSnapshot(SettingsSnapshot settingsSnapshot);

  Either<Failure, SettingsSnapshot> getSettingsSnapshot();
}
