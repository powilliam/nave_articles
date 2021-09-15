import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  static MaterialPageRoute<ArticleScreen> route() => MaterialPageRoute(
        builder: (_) => const ArticleScreen(),
      );

  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text('ArticleScreen'),
        ),
      );
}
