import 'package:equatable/equatable.dart';
import 'package:nave_articles/app/domain/entities/article.dart';
import 'package:nave_articles/app/domain/entities/category.dart';

abstract class ArticlesState {
  const ArticlesState();

  factory ArticlesState.loading() => const Loading();

  factory ArticlesState.successful({
    final List<Article> articles = const [],
    final List<Category> categories = const [],
  }) =>
      Successful(
        articles: articles,
        categories: categories,
      );

  factory ArticlesState.failed({required final String reason}) =>
      Failed(reason: reason);

  ArticlesState copyWith();
}

class Loading extends ArticlesState with EquatableMixin {
  const Loading();

  @override
  List<Object> get props => [];

  @override
  Loading copyWith() => const Loading();
}

class Successful extends ArticlesState with EquatableMixin {
  const Successful({
    this.articles = const [],
    this.categories = const [],
  });

  final List<Article> articles;
  final List<Category> categories;

  @override
  List<Object> get props => [articles, categories];

  @override
  Successful copyWith({
    final List<Article>? articles,
    final List<Category>? categories,
  }) =>
      Successful(
        articles: articles ?? this.articles,
        categories: categories ?? this.categories,
      );
}

class Failed extends ArticlesState with EquatableMixin {
  const Failed({required this.reason});

  final String reason;

  @override
  List<Object> get props => [reason];

  @override
  Failed copyWith({final String? reason}) =>
      Failed(reason: reason ?? this.reason);
}
