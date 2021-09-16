// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      title: json['title'] as String,
      author: json['author'] as String,
      thumbnail: json['thumbnail'] as String,
      link: json['link'] as String,
      content: json['content'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      publishedAt: json['pubDate'] as String,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'thumbnail': instance.thumbnail,
      'link': instance.link,
      'content': instance.content,
      'categories': instance.categories,
      'pubDate': instance.publishedAt,
    };
