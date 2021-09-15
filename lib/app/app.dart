import 'package:flutter/material.dart';
import 'package:nave_articles/app/presentation/screens/articles.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: const ArticlesScreen(),
      );
}
