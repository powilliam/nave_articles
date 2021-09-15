import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article extends Equatable {
  const Article({
    required this.title,
    required this.author,
    required this.thumbnail,
    required this.link,
    required this.content,
    required this.categories,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  final String title;
  final String author;
  final String thumbnail;
  final String link;
  final String content;
  final List<String> categories;
  @JsonKey(name: 'pubDate')
  final String publishedAt;

  @override
  List<Object> get props =>
      [title, author, thumbnail, link, content, categories, publishedAt];
}

extension ArticleExtension on Article {
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
