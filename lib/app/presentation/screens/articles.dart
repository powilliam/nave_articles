import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nave_articles/app/presentation/widgets/blurred_container.dart';
import 'package:nave_articles/app/presentation/widgets/svg_icon.dart';

class ArticlesScreen extends StatelessWidget {
  static MaterialPageRoute<ArticlesScreen> route() => MaterialPageRoute(
        builder: (_) => const ArticlesScreen(),
      );

  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            _SliverArticlesAppBar(),
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
        sigma: 2.25,
        opacity: .5,
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
