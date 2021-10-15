import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nave_articles/app/presentation/widgets/articles_list.dart';
import 'package:nave_articles/app/presentation/widgets/blurred_container.dart';
import 'package:nave_articles/app/presentation/widgets/category_filter.dart';
import 'package:nave_articles/app/presentation/widgets/svg_icon.dart';
import 'package:nave_articles/app/viewmodels/articles/articles.dart';
import 'package:nave_articles/app/viewmodels/articles/event.dart';
import 'package:nave_articles/app/viewmodels/articles/state.dart';

class ArticlesScreen extends StatelessWidget {
  static MaterialPageRoute<ArticlesScreen> route() => MaterialPageRoute(
        builder: (_) => const ArticlesScreen(),
      );

  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocConsumer<ArticlesViewModel, ArticlesState>(
          listener: (context, state) {
            if (state is ArticlesStateFailed) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(state.reason),
                  ),
                );
            }
          },
          builder: (context, state) => RefreshIndicator(
            edgeOffset: 64,
            onRefresh: () {
              BlocProvider.of<ArticlesViewModel>(context).add(
                ArticlesEvent.onRefresh(),
              );
              return Future.delayed(const Duration(seconds: 1));
            },
            child: CustomScrollView(
              slivers: <Widget>[
                _SliverArticlesAppBar(isLoading: state is ArticlesStateLoading),
                SliverCategoryFilterList(
                  categories: state is ArticlesStateSuccessful
                      ? state.categories
                      : const [],
                  onSelected: (isSelected, category) =>
                      BlocProvider.of<ArticlesViewModel>(context).add(
                    ArticlesEvent.onCategoryPressed(
                      isSelected: isSelected,
                      category: category,
                    ),
                  ),
                ),
                SliverArticlesList(
                  articles: state is ArticlesStateSuccessful
                      ? state.filteredArticles
                      : const [],
                )
              ],
            ),
          ),
        ),
      );
}

class _SliverArticlesAppBar extends StatelessWidget {
  const _SliverArticlesAppBar({
    Key? key,
    this.isLoading = false,
  }) : super(key: key);

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final TextStyle? headline6 = Theme.of(context).textTheme.headline6;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color scaffoldColor = Theme.of(context).scaffoldBackgroundColor;
    final Color cardColor = Theme.of(context).cardColor;

    return SliverAppBar(
      centerTitle: false,
      floating: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: BlurredContainer(
        sigma: 1,
        opacity: 0.8,
        color: scaffoldColor,
      ),
      leading: IconButton(
        onPressed: () {},
        icon: SvgIcon(
          icon: AssetIcon.rocket,
          color: colorScheme.primary,
        ),
      ),
      title: Text(
        'Articles',
        style: headline6?.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: isLoading
          ? PreferredSize(
              child: LinearProgressIndicator(
                backgroundColor: cardColor,
              ),
              preferredSize: Size(Size.infinite.width, 1),
            )
          : null,
    );
  }
}
