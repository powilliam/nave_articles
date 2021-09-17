import 'package:dio/dio.dart';

class GetRssAsJsonUseCase {
  const GetRssAsJsonUseCase(this._client);

  final Dio _client;

  Future<Response<Map<String, dynamic>>> execute(final String url) async {
    final Map<String, dynamic> queryParameters = {'rss_url': url};
    return await _client.get(
      '/v1/api.json',
      queryParameters: queryParameters,
    );
  }
}
