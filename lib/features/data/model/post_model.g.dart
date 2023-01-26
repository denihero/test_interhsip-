// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      image: json['image'] as String?,
      category: $enumDecodeNullable(_$CategoryEnumMap, json['category']),
      rating: RatingModel.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'image': instance.image,
      'category': _$CategoryEnumMap[instance.category],
      'rating': instance.rating,
    };

const _$CategoryEnumMap = {
  Category.MEN_S_CLOTHING: "men's clothing",
  Category.JEWELERY: 'jewelery',
  Category.ELECTRONICS: 'electronics',
  Category.WOMEN_S_CLOTHING: "women's clothing",
  Category.ALL: 'all',
};

_$_RatingModel _$$_RatingModelFromJson(Map<String, dynamic> json) =>
    _$_RatingModel(
      rate: (json['rate'] as num?)?.toDouble(),
      count: json['count'] as int?,
    );

Map<String, dynamic> _$$_RatingModelToJson(_$_RatingModel instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };
