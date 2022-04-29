import 'api_response.dart';

abstract class IApi {
  Future<ApiResponse> get(String url, {query, headers});
  Future<ApiResponse> post(String url, dynamic data, {query, headers});
}
