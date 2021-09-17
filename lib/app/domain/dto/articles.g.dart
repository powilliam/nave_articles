// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticlesDTO _$ArticlesDTOFromJson(Map<String, dynamic> json) => ArticlesDTO(
      articles: (json['items'] as List<dynamic>)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticlesDTOToJson(ArticlesDTO instance) =>
    <String, dynamic>{
      'items': instance.articles,
    };
