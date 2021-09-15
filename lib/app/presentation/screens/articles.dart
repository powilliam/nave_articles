import 'package:flutter/material.dart';

class ArticlesScreen extends StatelessWidget {
  static MaterialPageRoute<ArticlesScreen> route() => MaterialPageRoute(
        builder: (_) => const ArticlesScreen(),
      );

  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text('ArticlesScreen'),
        ),
      );
}
