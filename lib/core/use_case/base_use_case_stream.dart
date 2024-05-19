abstract class BaseUseCaseStream<Params, Response> {
  const BaseUseCaseStream();
  Stream<Response> call(Params params);
}