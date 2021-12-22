import 'config/api_model.dart';
import 'config/api_response.dart';

class BaseRemote extends ApiResponse {
  // get
  Future<ApiModel> apiGet(String url,
      {Map<String, dynamic>? queryParameters}) async {
    return await apiBase('get',
        queryParameters: queryParameters, url: url, data: {});
  }
  // end get

  // post
  Future<ApiModel> apiPost(
    String url, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await apiBase('post',
        url: url, data: data, queryParameters: queryParameters);
  }
  // end post

  // put
  Future<ApiModel> apiPut(
    String url, {
    required Map<String, dynamic> data,
    required Map<String, dynamic> queryParameters,
  }) async {
    return await apiBase('put',
        url: url, data: data, queryParameters: queryParameters);
  }

  Future<ApiModel> apiPutImage(
    String url, {
    required Map<String, dynamic> data,
    required Map<String, dynamic> queryParameters,
  }) async {
    return await apiBase('put-image',
        url: url, data: data, queryParameters: queryParameters);
  }
  // end put

  // delete
  Future<ApiModel> apiDelete(
    String url, {
    required Map<String, dynamic> data,
    required Map<String, dynamic> queryParameters,
  }) async {
    return await apiBase('delete',
        url: url, data: data, queryParameters: queryParameters);
  }
  // end delete
}
