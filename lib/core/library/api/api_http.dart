import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_interface.dart';
import 'api_response.dart';

class ApiHttp implements IApi {
  ApiHttp();

  @override
  Future<ApiResponse> get(String url, {query, headers}) async {
    final response = await http.get(Uri.parse(url), headers: headers);

    return ApiResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
  }

  @override
  Future<ApiResponse> post(String url, data, {query, headers}) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
