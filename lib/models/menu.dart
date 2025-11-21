import 'dart:convert';

import 'package:hubert_eat/models/item.dart';
import 'package:http/http.dart' as http;

class Menu {
  final List<Item> items;

  Menu({required this.items});
}

class MenuRepo {
  static Future<Menu?> getMenuByRestaurant(int id) async {
    try {
      Uri url = Uri.https(
        "fakerestaurantapi.runasp.net",
        "api/Restaurant/$id/menu",
      );
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return Menu(items: List<Item>.from(data.map((i) => Item.fromJson(i))));
      } else {
        throw Exception("Erreur API");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
