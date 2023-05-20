// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Purchase _$PurchaseFromJson(Map<String, dynamic> json) => Purchase(
      json['id'] as String,
      Category.fromJson(json['category'] as Map<String, dynamic>),
      json['cost'] as String,
    );

Map<String, dynamic> _$PurchaseToJson(Purchase instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'cost': instance.cost,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      json['id'] as int,
      json['name'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
