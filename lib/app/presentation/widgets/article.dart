import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nave_articles/app/domain/entities/article.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    final TextStyle? _headline6 = Theme.of(context).textTheme.headline6;
    final TextStyle? _body1 = Theme.of(context).textTheme.bodyText1;
    final TextStyle _notoSerifSubtitle1 = GoogleFonts.notoSerif(
      textStyle: _headline6,
      fontWeight: FontWeight.bold,
      fontSize: _headline6?.fontSize,
    );
    final TextStyle _notoSerifBody2 = GoogleFonts.notoSerif(
      textStyle: _body1,
      fontSize: _body1?.fontSize,
      color: Colors.black.withOpacity(0.8),
    );

    return Card(
      elevation: 0,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          article.title,
                          style: _notoSerifSubtitle1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            article.author,
                            style: _notoSerifBody2,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    spacing: 8,
                    children: article.categories
                        .map(
                          (category) => Chip(
                            label: Text(category),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
