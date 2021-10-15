import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nave_articles/app/domain/entities/category.dart';
import 'package:nave_articles/app/domain/repositories/articles.dart';
import 'package:nave_articles/app/viewmodels/articles/event.dart';
import 'package:nave_articles/app/viewmodels/articles/state.dart';

class ArticlesViewModel extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesViewModel(
    this._repository,
  ) : super(ArticlesState.successful());

  final ArticlesRepository _repository;

  @override
  Stream<ArticlesState> mapEventToState(ArticlesEvent event) async* {
    if (event is ArticlesEventGotten) {
      yield* _mapArticlesGottenOrOnRefreshToState();
    } else if (event is ArticlesEventOnCategoryPressed) {
      yield* _mapArticlesOnCategoryPressed(event);
    } else if (event is ArticlesEventOnRefresh) {
      yield* _mapArticlesGottenOrOnRefreshToState(isRefreshing: true);
    }
  }

  Stream<ArticlesState> _mapArticlesGottenOrOnRefreshToState({
    final bool isRefreshing = false,
  }) async* {
    try {
      yield isRefreshing ? ArticlesState.loading() : state.copyWith();
      final response = await _repository.getArticlesAndCategories();
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
