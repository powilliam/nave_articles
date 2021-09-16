import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nave_articles/app/domain/entities/article.dart';
import 'package:nave_articles/app/presentation/widgets/articles_list.dart';
import 'package:nave_articles/app/presentation/widgets/blurred_container.dart';
import 'package:nave_articles/app/presentation/widgets/category_filter.dart';
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
            SliverCategoryFilterList(
              categories: _categories,
              onSelect: (isSelected, index) {},
            ),
            SliverArticlesList(
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
    final bool _isLight = Theme.of(context).brightness == Brightness.light;
    final Color _contentColor =
        _isLight ? _colorScheme.primary : _colorScheme.secondary;
    final Color _scaffoldColor = Theme.of(context).scaffoldBackgroundColor;

    return SliverAppBar(
      centerTitle: false,
      floating: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: BlurredContainer(
        sigma: 1,
        opacity: 0.8,
        color: _scaffoldColor,
      ),
      leading: IconButton(
        onPressed: () {},
        icon: SvgIcon(
          icon: AssetIcon.rocket,
          color: _contentColor,
        ),
      ),
      title: Text(
        'Articles',
        style: _titleStyle.copyWith(color: _contentColor),
      ),
    );
  }
}
