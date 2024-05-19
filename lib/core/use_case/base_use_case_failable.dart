import 'package:dartz/dartz.dart';

import '../failure/failure.dart';
abstract class BaseUseCaseFailable<Params, Response> {
  const BaseUseCaseFailable();
  Either<Failure, Response> call(Params params);
}