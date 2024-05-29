import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import '../../../core/use_case/base_use_case_async.dart';
import '../entity/settings_snapshot.dart';
import '../repository/local_repository.dart';

class SaveSettings extends BaseUseCaseAsync<SettingsSnapshot, void> {
  final LocalRepository _localRepository;

  const SaveSettings({
    required LocalRepository localRepository,
  }) : _localRepository = localRepository;

  @override
  Future<Either<Failure, void>> call(SettingsSnapshot params) {
    return _localRepository.saveSettingsSnapshot(params);
  }
}
