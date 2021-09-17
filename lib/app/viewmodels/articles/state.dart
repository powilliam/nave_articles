import 'package:equatable/equatable.dart';
import 'package:nave_articles/app/domain/entities/article.dart';
import 'package:nave_articles/app/domain/entities/category.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();

  factory ArticlesState.loading() => const ArticlesStateLoading();

  factory ArticlesState.successful({
    final List<Article> articles = const [],
    final List<Category> categories = const [],
  }) =>
      ArticlesStateSuccessful(
        articles: articles,
        categories: categories,
      );

  factory ArticlesState.failed({required final String reason}) =>
      ArticlesStateFailed(reason: reason);

  ArticlesState copyWith();
}

class ArticlesStateLoading extends ArticlesState {
  const ArticlesStateLoading();

  @override
  List<Object> get props => [];

  @override
  ArticlesStateLoading copyWith() => const ArticlesStateLoading();
}

class ArticlesStateSuccessful extends ArticlesState {
  const ArticlesStateSuccessful({
    this.articles = const [],
    this.categories = const [],
  });

  final List<Article> articles;
  final List<Category> categories;

  @override
  List<Object> get props => [articles, categories];

  @override
  ArticlesStateSuccessful copyWith({
    final List<Article>? articles,
    final List<Category>? categories,
  }) =>
      ArticlesStateSuccessful(
        articles: articles ?? this.articles,
        categories: categories ?? this.categories,
      );
}

class ArticlesStateFailed extends ArticlesState {
  const ArticlesStateFailed({required this.reason});

  final String reason;

  @override
  List<Object> get props => [reason];

  @override
  ArticlesStateFailed copyWith({final String? reason}) =>
      ArticlesStateFailed(reason: reason ?? this.reason);
}
