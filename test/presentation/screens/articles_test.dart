import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nave_articles/app/presentation/screens/articles.dart';
import 'package:nave_articles/app/presentation/widgets/article.dart';
import 'package:nave_articles/app/presentation/widgets/articles_list.dart';
import 'package:nave_articles/app/presentation/widgets/category_filter.dart';
import 'package:nave_articles/app/presentation/widgets/svg_icon.dart';

void main() {
  testWidgets('Articles Screen should be able to render',
      (final WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ArticlesScreen(),
      ),
    );

    expect(find.text('Articles'), findsOneWidget);
    expect(
      find.byWidgetPredicate((final Widget widget) =>
          widget is SvgIcon && widget.icon == AssetIcon.rocket),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
          (final Widget widget) => widget is SliverCategoryFilterList),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (final Widget widget) => widget is SliverArticlesList,
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (final Widget widget) => widget is ArticleCard,
      ),
      findsWidgets,
    );
  });
}
