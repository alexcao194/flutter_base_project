abstract class BaseUseCase<Params, Response> {
  const BaseUseCase();
  Response call(Params params);
}
