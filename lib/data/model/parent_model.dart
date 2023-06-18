import 'package:demo/domain/entities/parent_entity.dart';
import 'package:flutter/foundation.dart';

import 'category_model.dart';


@immutable
class ParentModel extends ParentEntity {

  const ParentModel({List<CategoryModel>? categories}) : super(categories: categories);

  factory ParentModel.fromJson(Map<String, dynamic> json) => ParentModel(
    categories: (json['categories'] as List<dynamic>?)
        ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'categories': categories?.map((e) => e.toJson()).toList(),
  };
}
