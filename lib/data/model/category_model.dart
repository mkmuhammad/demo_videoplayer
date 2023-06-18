

import 'package:demo/data/model/video_model.dart';

class CategoryModel {
  String? name;
  List<VideoModel>? videos;

  CategoryModel({this.name, this.videos});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    name: json['name'] as String?,
    videos: (json['videos'] as List<dynamic>?)
        ?.map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'videos': videos?.map((e) => e.toJson()).toList(),
  };
}