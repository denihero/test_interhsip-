import 'package:freezed_annotation/freezed_annotation.dart';

class ProductEntity {
  ProductEntity({
    required this.category,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
  });

  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? image;
  final Category? category;
  final RatingEntity? rating;
}

class RatingEntity {
  RatingEntity({
    required this.rate,
    required this.count,
  });

  final double? rate;
  final int? count;
}

enum Category {
  @JsonValue("men's clothing")
  MEN_S_CLOTHING,
  @JsonValue("jewelery")
  JEWELERY,
  @JsonValue("electronics")
  ELECTRONICS,
  @JsonValue("women's clothing")
  WOMEN_S_CLOTHING,
  @JsonValue("all")
  ALL
}
