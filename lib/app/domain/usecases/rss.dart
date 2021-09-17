import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class GetRssAsJsonUseCase<T extends Equatable> {
  const GetRssAsJsonUseCase(this._client);

  final Dio _client;

  Future<Response<T>> execute(final String url) async {
    final Map<String, dynamic> queryParameters = {'rss_url': url};
    return await _client.get<T>(
      '/v1/api.json',
      queryParameters: queryParameters,
    );
  }
}
