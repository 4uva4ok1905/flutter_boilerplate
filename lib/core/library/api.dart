import 'api/api_interface.dart';
import 'api/api_response.dart';

class AppHttpClient {
  final IApi _provider;

  final String _baseUrl;

  AppHttpClient(this._provider, this._baseUrl);

  Future<ApiResponse> get(url, {query, headers}) async {
    return _provider.get(prepareUrl(url), query: query, headers: headers);
  }

  Future<ApiResponse> post(url, data, {query, headers}) async {
    return _provider.post(prepareUrl(url), data, query: query, headers: headers);
  }

  String prepareUrl(url) {
    return _baseUrl + '/' + url;
  }
}
