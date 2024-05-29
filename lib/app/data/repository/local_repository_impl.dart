import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import '../../../generated/l10n.dart';
import '../../domain/entity/settings_snapshot.dart';
import '../../domain/repository/local_repository.dart';
import '../data_source/local_data.dart';
import '../model/settings_snapshot_model.dart';

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
