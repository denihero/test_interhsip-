import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_project_intership/features/domain/entity/post_entity.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class ProductModel extends ProductEntity with _$ProductModel{
  const factory ProductModel(
      {required int? id,
      required String? title,
      required double? price,
      required String? description,
      required String? image,
        required Category? category,
      required RatingModel rating}) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}

@freezed
class RatingModel extends RatingEntity with _$RatingModel {
  const factory RatingModel({required double? rate, required int? count}) = _RatingModel;

  factory RatingModel.fromJson(Map<String, dynamic> json) => _$RatingModelFromJson(json);
}
