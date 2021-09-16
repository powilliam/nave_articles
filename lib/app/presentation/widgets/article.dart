import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nave_articles/app/domain/entities/article.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    final TextStyle? _headline6 = Theme.of(context)
        .textTheme
        .headline6
        ?.copyWith(fontWeight: FontWeight.bold);
    final TextStyle? _body1 = Theme.of(context).textTheme.bodyText1;
    final Color _scaffoldColor = Theme.of(context).scaffoldBackgroundColor;

    return Card(
      color: _scaffoldColor,
      elevation: 0,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      article.title,
                      style: _headline6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        article.author,
                        style: _body1?.copyWith(
                          color: _body1.color?.withOpacity(0.6),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    width: 98,
                    height: 98,
                    child: Image.network(
                      article.thumbnail,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
