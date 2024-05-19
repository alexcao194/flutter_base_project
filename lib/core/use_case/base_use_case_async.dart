import 'package:dartz/dartz.dart';

import '../failure/failure.dart';

abstract class BaseUseCaseAsync<Params, Response> {
  const BaseUseCaseAsync();
  Future<Either<Failure, Response>> call(Params params);
}
