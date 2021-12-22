// BASE RESPONSE
import 'package:dio/dio.dart';
import 'package:sinarmas/data/remote/config/dio_module.dart';

import 'api_model.dart';

class ApiResponse extends DioModule {
  Future<ApiModel> apiBase(
    String type, {
    required String url,
    required Map<String, dynamic> data,
    required Map<String, dynamic>? queryParameters,
  }) async {
    String errorMessageKey = 'server_error';
    String errorMessage =
        'Sorry, System is trouble right now. Try again later !!!';

    try {
      Response<Map> endpoint;
      if (type == 'post') {
        FormData formData = FormData.fromMap(data);
        endpoint = await dio.post(url,
            data: formData, queryParameters: queryParameters);
      } else if (type == 'put') {
        FormData formData = FormData.fromMap(data);
        endpoint = await dio.post(url,
            data: formData, queryParameters: queryParameters);
      } else if (type == 'put-image') {
        FormData formData = FormData.fromMap(data);
        Options options = Options(
          headers: {"content-type": "multipart/form-data"},
        );
        endpoint = await dio.post(url,
            data: formData, options: options, queryParameters: queryParameters);
      } else if (type == 'delete') {
        endpoint = await dio.request(
          url,
          options: Options(method: 'delete'),
          queryParameters: queryParameters,
        );
      } else {
        endpoint = await dio.get(url, queryParameters: queryParameters);
      }

      Map? responseBody = endpoint.data;

      return ApiModel(
        status: true,
        data: responseBody,
        message: 'Success',
        messageKey: 'success',
        messages: const ['berhasil'],
        statusCode: 200,
      );
      // ignore: unused_catch_clause
    } on DioError catch (e) {
      // if (e.type == DioErrorType.CONNECT_TIMEOUT ||
      //     e.type == DioErrorType.RECEIVE_TIMEOUT ||
      //     e.type == DioErrorType.SEND_TIMEOUT) {
      //   errorMessageKey = 'conection_timeout';
      //   errorMessage = 'Koneksi internet Anda tidak stabil';
      // }
      // if (e.type == DioErrorType.CANCEL) {
      //   errorMessageKey = 'conection_cancel';
      //   errorMessage = 'Permintaan Anda dibatalkan';
      // }
      // if (e.type == DioErrorType.DEFAULT) {
      //   errorMessageKey = 'error_default';
      //   // errorMessage = 'Tidak ada konesksi internet';
      // }
      return ApiModel(
        status: false,
        data: null,
        message: errorMessage,
        messageKey: errorMessageKey,
        messages: const ['Error'],
        statusCode: 0,
      );
    }
  }
}
