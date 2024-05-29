import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import '../../../generated/l10n.dart';
import '../../domain/entities/settings_snapshot.dart';
import '../../domain/repositories/local_repository.dart';
import '../data_sources/local_data.dart';
import '../models/settings_snapshot_model.dart';

class LocalRepositoryImpl implements LocalRepository {
  final LocalData _localData;

  const LocalRepositoryImpl({
    required LocalData localData,
  }) : _localData = localData;

  @override
  Future<Either<Failure, void>> saveSettingsSnapshot(SettingsSnapshot settingsSnapshot) async {
    try {
      await _localData.saveSettingsSnapshot(SettingsSnapshotModel.fromEntity(settingsSnapshot));
      return const Right(null);
    } on Exception {
      return Left(Failure(S.current.save_settings_fail));
    }
  }

  @override
  Either<Failure, SettingsSnapshot> getSettingsSnapshot() {
    try {
      final settingsSnapshot = _localData.getSettingsSnapshot();
      return Right(settingsSnapshot.toEntity());
    } on Exception {
      return Left(Failure(S.current.get_settings_fail));
    }
  }
}
