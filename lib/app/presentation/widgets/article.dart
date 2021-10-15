import 'package:flutter/material.dart';
import 'package:nave_articles/app/domain/entities/article.dart';
import 'package:nave_articles/app/presentation/utils/string.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    final TextStyle? headline6 = Theme.of(context)
        .textTheme
        .headline6
        ?.copyWith(fontWeight: FontWeight.bold);
    final TextStyle? body1 = Theme.of(context).textTheme.bodyText1;
    final Color scaffoldColor = Theme.of(context).scaffoldBackgroundColor;

    return Card(
      color: scaffoldColor,
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () async =>
            await canLaunch(article.link) ? await launch(article.link) : null,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          article.title,
                          style: headline6,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "${article.author} | ${article.publishedAt.date()}",
                            style: body1?.copyWith(
                              color: body1.color?.withOpacity(0.6),
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
                          errorBuilder: (context, error, stacktrace) =>
                              const Icon(Icons.error_outline),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
