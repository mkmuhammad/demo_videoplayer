import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../data/model/category_model.dart';



@immutable
class ParentEntity extends Equatable{
  final List<CategoryModel>? categories;

  const ParentEntity({this.categories});

  factory ParentEntity.fromJson(Map<String, dynamic> json) => ParentEntity(
    categories: (json['categories'] as List<dynamic>?)
        ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'categories': categories?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [categories];
}
