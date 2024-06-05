import 'package:dio/dio.dart';

import '../../constants/api_env.dart';
import 'logging_interceptor.dart';

class AppDio {
  static const String _baseUrl = ApiEnv.stageBaseUrl;

  static const int _connectTimeout = 30000;
  static const int _receiveTimeout = 30000;

  Dio? _dio;

  Dio get dio {
    _dio ??= _get();
    return _dio!;
  }

  Dio _get() {
    return Dio()
      ..options = BaseOptions(
        baseUrl: _baseUrl,
        responseType: ResponseType.json,
        connectTimeout: const Duration(milliseconds: _connectTimeout),
        receiveTimeout: const Duration(milliseconds: _receiveTimeout),
      )
      ..interceptors.add(LoggingInterceptor());
  }
}
