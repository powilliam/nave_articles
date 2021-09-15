import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nave_articles/app/presentation/screens/articles.dart';

void main() {
  testWidgets('Articles Screen should be able to render',
      (final WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ArticlesScreen(),
      ),
    );

    expect(find.text('ArticlesScreen'), findsOneWidget);
    expect(find.byWidgetPredicate((final Widget widget) => widget is Scaffold),
        findsOneWidget);
  });
}
