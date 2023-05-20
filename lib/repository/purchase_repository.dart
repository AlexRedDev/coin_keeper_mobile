import 'package:coin_keeper_mobile/api/purchase_api.dart';
import 'package:coin_keeper_mobile/models/purchase.dart';

abstract class PurchaseRepository {
  static Future<List<Category>> getAllCategory() async {
    final data = await PurchaseApi.getAllCategory();
    return data.map((json) => Category.fromJson(json)).toList();
  }
}
