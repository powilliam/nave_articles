import 'package:flutter/material.dart';
import 'package:nave_articles/app/presentation/widgets/svg_icon.dart';

class ArticlesScreen extends StatelessWidget {
  static MaterialPageRoute<ArticlesScreen> route() => MaterialPageRoute(
        builder: (_) => const ArticlesScreen(),
      );

  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('ArticlesScreen'),
              SvgIcon(
                icon: AssetIcon.rocket,
                color: Theme.of(context).colorScheme.primary,
              )
            ],
          ),
        ),
      );
}
