import 'package:nave_articles/app/domain/entities/category.dart';
import 'package:nave_articles/app/domain/usecases/nave.dart';

enum Response { articles, categories }

class ArticlesRepository {
  const ArticlesRepository(
    this._getNaveArticlesUseCase,
  );

  final GetNaveArticlesUseCase _getNaveArticlesUseCase;

  Future<Map<Response, dynamic>> getArticlesAndCategories() async {
    final dto = await _getNaveArticlesUseCase.execute();
    return {
      Response.articles: dto.articles,
      Response.categories: dto.articles
          .fold<List<String>>([], (categories, article) {
            for (final category in article.categories) {
              if (!categories.contains(category)) {
                categories.add(category);
              }
            }
            return categories;
          })
          .map((category) => Category(label: category))
          .toList(),
    };
  }
}
