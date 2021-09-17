import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nave_articles/app/domain/entities/category.dart';
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
      final categories = dto.articles
          .fold<List<String>>([], (categories, article) {
            for (final category in article.categories) {
              if (!categories.contains(category)) {
                categories.add(category);
              }
            }
            return categories;
          })
          .map((category) => Category(label: category))
          .toList();
      yield ArticlesState.successful(
          articles: dto.articles, categories: categories);
    } on Exception catch (e) {
      yield ArticlesState.failed(reason: e.toString());
    }
  }

  Stream<ArticlesState> _mapArticlesOnCategoryPressed(
    OnCategoryPressed event,
  ) async* {
    try {
      final indexOfCategory =
          (state as ArticlesStateSuccessful).categories.indexOf(
                event.category,
              );
      final newCategory = event.category.copyWith(isSelected: event.isSelected);
      final newCategories = [...(state as ArticlesStateSuccessful).categories]
        ..removeAt(indexOfCategory)
        ..insert(indexOfCategory, newCategory);
      yield (state as ArticlesStateSuccessful).copyWith(
        // articles: filteredArticles,
        categories: newCategories,
      );
    } on Error {
      yield state;
    }
  }
}
