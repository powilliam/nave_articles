import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nave_articles/app/domain/entities/article.dart';
import 'package:nave_articles/app/presentation/widgets/article.dart';
import 'package:nave_articles/app/presentation/widgets/blurred_container.dart';
import 'package:nave_articles/app/presentation/widgets/svg_icon.dart';

final List<Article> _articles = List.generate(
  15,
  (index) => {
    "title":
        "O encontro de uma mulher com a tecnologia - minha trajetória até a Nave.rs",
    "pubDate": "2021-07-28 13:57:52",
    "link": "",
    "author": "Bruna Freitas",
    "thumbnail":
        "https://cdn-images-1.medium.com/max/1024/1*3qh6Yp8REKsyV89u656YHg.png",
    "content": "",
    "categories": ["soft-skills", "cultura", "naveteam", "comunicação"]
  },
).map((json) => Article.fromJson(json)).toList();

final List<String> _categories = _articles.fold([], (categories, article) {
  for (final category in article.categories) {
    if (!categories.contains(category)) {
      categories.add(category);
    }
  }
  return categories;
});

class ArticlesScreen extends StatelessWidget {
  static MaterialPageRoute<ArticlesScreen> route() => MaterialPageRoute(
        builder: (_) => const ArticlesScreen(),
      );

  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const _SliverArticlesAppBar(),
            _SliverCategoryFilterList(
              categories: _categories,
              onSelect: (isSelected, index) {},
            ),
            _SliverArticlesList(
              articles: _articles,
            ),
          ],
        ),
      );
}

class _SliverArticlesAppBar extends StatelessWidget {
  const _SliverArticlesAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? _headline6 = Theme.of(context).textTheme.headline6;
    final TextStyle _titleStyle =
        GoogleFonts.notoSans(fontWeight: FontWeight.bold)
            .copyWith(fontStyle: _headline6?.fontStyle);
    final ColorScheme _colorScheme = Theme.of(context).colorScheme;

    return SliverAppBar(
      centerTitle: false,
      floating: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: BlurredContainer(
        sigma: 2.5,
        opacity: .8,
        color: _colorScheme.primary,
      ),
      leading: IconButton(
        onPressed: () {},
        icon: const SvgIcon(
          icon: AssetIcon.rocket,
        ),
      ),
      title: Text(
        'Articles',
        style: _titleStyle,
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bookmarks),
        )
      ],
    );
  }
}

class _SliverCategoryFilterList extends StatelessWidget {
  const _SliverCategoryFilterList({
    Key? key,
    this.categories = const [],
    required this.onSelect,
  }) : super(key: key);

  final List<String> categories;
  final void Function(bool, int) onSelect;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
            child: Row(
              children: categories
                  .map(
                    (category) => Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: FilterChip(
                        selected: false,
                        onSelected: (selected) => onSelect(
                          selected,
                          categories.indexOf(category),
                        ),
                        label: Text(category),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      );
}

class _SliverArticlesList extends StatelessWidget {
  const _SliverArticlesList({
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
