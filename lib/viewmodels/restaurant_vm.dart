import 'package:hubert_eat/models/item.dart';
import 'package:hubert_eat/models/menu.dart';

class RestaurantVm {
  static Future<List<Item>> fetchMenu(int id) async {
    var menu = await MenuRepo.getMenuByRestaurant(id);

    if (menu != null) {
      return menu.items;
    } else {
      return [];
    }
  }
}
