import 'package:dio/dio.dart';
import 'package:nave_articles/app/domain/usecases/nave.dart';
import 'package:nave_articles/app/domain/usecases/rss.dart';

abstract class AppContainer {
  static final Dio provideRssClient = Dio(
    BaseOptions(baseUrl: 'https://api.rss2json.com/'),
  );

  static final GetRssAsJsonUseCase provideGetRssAsJsonUseCaseForArticles =
      GetRssAsJsonUseCase(provideRssClient);

  static final GetNaveArticlesUseCase provideNaveArticlesUseCase =
      GetNaveArticlesUseCase(provideGetRssAsJsonUseCaseForArticles);
}
