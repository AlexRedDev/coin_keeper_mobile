import 'package:json_annotation/json_annotation.dart';

part 'purchase.g.dart';

@JsonSerializable()
class Purchase {
  final String id;
  final Category category;
  final String cost;

  const Purchase(this.id, this.category, this.cost);

  factory Purchase.fromJson(Map<String, dynamic> json) =>
      _$PurchaseFromJson(json);
}

@JsonSerializable()
class Category {
  final int id;
  final String name;

  Category(this.id, this.name);

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
