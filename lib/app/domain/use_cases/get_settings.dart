import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import '../../../core/use_case/base_use_case_failable.dart';
import '../entities/settings_snapshot.dart';
import '../repositories/static_repository.dart';

class GetSettings extends BaseUseCaseFailable<void, SettingsSnapshot> {
  final StaticRepository _staticRepository;

  const GetSettings({
    required StaticRepository staticRepository,
  }) : _staticRepository = staticRepository;

  @override
  Either<Failure, SettingsSnapshot> call(void params) {
    return _staticRepository.getSettingsSnapshot();
  }
}
