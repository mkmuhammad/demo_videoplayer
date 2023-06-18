import 'package:flutter/foundation.dart';

@immutable
class VideoModel {
  final String? description;
  final List<dynamic>? sources;
  final String? subtitle;
  final String? thumb;
  final String? title;

  const VideoModel({
    this.description,
    this.sources,
    this.subtitle,
    this.thumb,
    this.title,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
    description: json['description'] as String?,
    sources: json['sources'] as List<dynamic>?,
    subtitle: json['subtitle'] as String?,
    thumb: json['thumb'] as String?,
    title: json['title'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'description': description,
    'sources': sources,
    'subtitle': subtitle,
    'thumb': thumb,
    'title': title,
  };
}
