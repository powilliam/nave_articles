import 'package:dio/dio.dart';
import 'package:nave_articles/app/domain/dto/articles.dart';
import 'package:nave_articles/app/domain/usecases/rss.dart';

class GetNaveArticlesUseCase {
  const GetNaveArticlesUseCase(this._rssAsJsonUseCase);

  final GetRssAsJsonUseCase<ArticlesDTO> _rssAsJsonUseCase;

  Future<ArticlesDTO?> execute() async {
    try {
      final response = await _rssAsJsonUseCase.execute(
        'https://medium.com/feed/nave-team',
      );
      return response.data;
    } on DioError catch (error) {
      throw Exception(
        'Failed to execute GetNaveArticlesUseCase. StatusCode: ${error.response?.statusCode}',
      );
    }
  }
}
