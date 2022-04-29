import 'package:dio/dio.dart';

import 'api_interface.dart';
import 'api_response.dart';

class ApiDio implements IApi {

  final _dio = Dio();

  @override
  Future<ApiResponse> get(String url, {query, headers}) async {
    final response = await _dio.get<Map<String, dynamic>>(url,
        queryParameters: query, options: Options(headers: headers));

    return ApiResponse(statusCode: response.statusCode, data: response.data);
  }

  @override
  Future<ApiResponse> post(String url, data, {query, headers}) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
