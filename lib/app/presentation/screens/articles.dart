import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nave_articles/app/di/app.dart';
import 'package:nave_articles/app/domain/entities/article.dart';
import 'package:nave_articles/app/presentation/widgets/articles_list.dart';
import 'package:nave_articles/app/presentation/widgets/blurred_container.dart';
import 'package:nave_articles/app/presentation/widgets/category_filter.dart';
import 'package:nave_articles/app/presentation/widgets/svg_icon.dart';

class ArticlesScreen extends StatefulWidget {
  static MaterialPageRoute<ArticlesScreen> route() => MaterialPageRoute(
        builder: (_) => const ArticlesScreen(),
      );

  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  List<Article> _articles = const [];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const _SliverArticlesAppBar(),
            SliverCategoryFilterList(
              categories: const [],
              onSelect: (isSelected, category) => setState(() {
                // final indexOfCategory = _filters.indexOf(category);
                // final newCategory = _filters
                //     .elementAt(indexOfCategory)
                //     .copyWith(isSelected: isSelected);
                // _filters.removeAt(indexOfCategory);
                // _filters.insert(indexOfCategory, newCategory);
              }),
            ),
            SliverArticlesList(
              articles: _articles,
            ),
          ],
        ),
      );

  @override
  void initState() {
    super.initState();
    AppContainer.provideNaveArticlesUseCase.execute().then(
          (response) => setState(
            () {
              _articles = response.articles;
            },
          ),
        );
  }
}

class _SliverArticlesAppBar extends StatelessWidget {
  const _SliverArticlesAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? _headline6 = Theme.of(context).textTheme.headline6;
    final ColorScheme _colorScheme = Theme.of(context).colorScheme;
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
          color: _colorScheme.primary,
        ),
      ),
      title: Text(
        'Articles',
        style: _headline6?.copyWith(
          color: _colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
