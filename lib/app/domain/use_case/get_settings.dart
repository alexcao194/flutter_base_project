import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import '../../../core/use_case/base_use_case_failable.dart';
import '../entity/settings_snapshot.dart';
import '../repository/local_repository.dart';

class GetSettings extends BaseUseCaseFailable<void, SettingsSnapshot> {
  final LocalRepository _localRepository;

  const GetSettings({
    required LocalRepository localRepository,
  }) : _localRepository = localRepository;

  @override
  Either<Failure, SettingsSnapshot> call(void params) {
    return _localRepository.getSettingsSnapshot();
  }
}
