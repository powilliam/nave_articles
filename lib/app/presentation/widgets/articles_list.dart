import 'package:flutter/material.dart';
import 'package:nave_articles/app/domain/entities/article.dart';
import 'package:nave_articles/app/presentation/widgets/article.dart';

class SliverArticlesList extends StatelessWidget {
  const SliverArticlesList({
    Key? key,
    this.articles = const [],
  }) : super(key: key);

  final List<Article> articles;

  @override
  Widget build(BuildContext context) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ArticleCard(article: articles[index]),
          childCount: articles.length,
        ),
      );
}