import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import '../../../core/use_case/base_use_case_async.dart';
import '../entities/settings_snapshot.dart';
import '../repositories/static_repository.dart';

class SaveSettings extends BaseUseCaseAsync<SettingsSnapshot, void> {
  final StaticRepository _staticRepository;

  const SaveSettings({
    required StaticRepository staticRepository,
  }) : _staticRepository = staticRepository;

  @override
  Future<Either<Failure, void>> call(SettingsSnapshot params) {
    return _staticRepository.saveSettingsSnapshot(params);
  }
}
