import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nave_articles/app/domain/usecases/nave.dart';
import 'package:nave_articles/app/viewmodels/articles/event.dart';
import 'package:nave_articles/app/viewmodels/articles/state.dart';

class ArticlesViewModel extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesViewModel({required this.getNaveArticlesUseCase})
      : super(ArticlesState.successful(articles: [], categories: []));

  final GetNaveArticlesUseCase getNaveArticlesUseCase;

  @override
  Stream<ArticlesState> mapEventToState(ArticlesEvent event) async* {
    switch (event.runtimeType) {
      case Gotten:
        yield* _mapArticlesGottenToState();
        break;
      case OnCategoryPressed:
        yield* _mapArticlesOnCategoryPressed(event as OnCategoryPressed);
        break;
      default:
        break;
    }
  }

  Stream<ArticlesState> _mapArticlesGottenToState() async* {
    try {
      yield ArticlesState.loading();
      final dto = await getNaveArticlesUseCase.execute();
      yield ArticlesState.successful(articles: dto.articles, categories: []);
    } on Exception catch (e) {
      yield ArticlesState.failed(reason: e.toString());
    }
  }

  Stream<ArticlesState> _mapArticlesOnCategoryPressed(
    OnCategoryPressed event,
  ) async* {}
}
