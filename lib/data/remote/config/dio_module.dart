import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'api_url.dart';
import 'logging_interceptor.dart';

class DioModule {
  Dio get dio => _dio();

  // CONFIG DIO
  Dio _dio() {
    final options = BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      contentType: Headers.jsonContentType,
      // Transform the response data to a String encoded with UTF8.
      // The default value is [ResponseType.JSON].
      responseType: ResponseType.plain,
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
      headers: {"Accept": "application/json"},
    );

    Dio dio = Dio(options);

    dio.interceptors.add(LoggingInterceptor());
    dio.httpClientAdapter = DefaultHttpClientAdapter();

    return dio;
  }
}
