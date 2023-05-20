import 'package:coin_keeper_mobile/core/supabase_client.dart';

class PurchaseApi {
  static Future<List<Map<String, dynamic>>> getAllCategory() async {
    final List<Map<String, dynamic>> data =
        await supabase.from('category').select('id, name');

    print(data);
    return data;
  }
}
