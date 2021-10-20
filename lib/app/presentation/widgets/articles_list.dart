import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nave_articles/app/domain/entities/article.dart';
import 'package:nave_articles/app/presentation/widgets/article.dart';

class SliverArticlesList extends StatelessWidget {
  const SliverArticlesList({
    Key? key,
    this.articles = const [],
  }) : super(key: key);

  final List<Article> articles;

  @override
  Widget build(BuildContext context) => articles.isEmpty
      ? SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Lottie.asset('assets/astronaut-animation.json'),
            ),
          ),
        )
      : SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => index.isEven
                ? ArticleCard(article: articles[index ~/ 2])
                : const Divider(),
            semanticIndexCallback: (widget, index) =>
                index.isEven ? index ~/ 2 : null,
            childCount: articles.length * 2 - 1,
          ),
        );
}
