import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nave_articles/app/domain/entities/article.dart';

part 'articles.g.dart';

@JsonSerializable()
class ArticlesDTO extends Equatable {
  const ArticlesDTO({required this.articles});

  factory ArticlesDTO.fromJson(Map<String, dynamic> json) =>
      _$ArticlesDTOFromJson(json);

  @JsonKey(name: 'items')
  final List<Article> articles;

  @override
  List<Object> get props => [articles];
}

extension ArticlesDTOExtension on ArticlesDTO {
  Map<String, dynamic> toJson() => _$ArticlesDTOToJson(this);
}
