import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nave_articles/app/domain/entities/category.dart';
import 'package:nave_articles/app/domain/repositories/articles.dart';
import 'package:nave_articles/app/domain/usecases/nave.dart';
import 'package:nave_articles/app/viewmodels/articles/event.dart';
import 'package:nave_articles/app/viewmodels/articles/state.dart';

class ArticlesViewModel extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesViewModel({
    required this.repository,
    required this.getNaveArticlesUseCase,
  }) : super(
          ArticlesState.successful(articles: const [], categories: const []),
        );

  final ArticlesRepository repository;
  final GetNaveArticlesUseCase getNaveArticlesUseCase;

  @override
  Stream<ArticlesState> mapEventToState(ArticlesEvent event) async* {
    switch (event.runtimeType) {
      case ArticlesEventGotten:
        yield* _mapArticlesGottenToState();
        break;
      case ArticlesEventOnCategoryPressed:
        yield* _mapArticlesOnCategoryPressed(
            event as ArticlesEventOnCategoryPressed);
        break;
      default:
        break;
    }
  }

  Stream<ArticlesState> _mapArticlesGottenToState() async* {
    try {
      yield ArticlesState.loading();
      final response = await repository.getArticlesAndCategories();
      yield ArticlesState.successful(
        articles: response[Response.articles],
        categories: response[Response.categories],
      );
    } on Exception catch (e) {
      yield ArticlesState.failed(reason: e.toString());
    }
  }

  Stream<ArticlesState> _mapArticlesOnCategoryPressed(
    ArticlesEventOnCategoryPressed event,
  ) async* {
    try {
      final indexOfCategory =
          (state as ArticlesStateSuccessful).categories.indexOf(event.category);
      final newCategory = event.category.copyWith(isSelected: event.isSelected);
      final newCategories = [...(state as ArticlesStateSuccessful).categories]
        ..removeAt(indexOfCategory)
        ..insert(indexOfCategory, newCategory);
      yield (state as ArticlesStateSuccessful).copyWith(
        categories: newCategories,
      );
    } on Error {
      yield state;
    }
  }
}
