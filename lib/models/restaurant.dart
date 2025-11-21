import 'package:http/http.dart' as http;
import 'dart:convert';

class Restaurant {
  const Restaurant({
    required this.restaurantID,
    required this.restaurantName,
    required this.address,
    required this.type,
  });

  final int restaurantID;
  final String restaurantName;
  final String address;
  final String type;
}

class RestaurantRepo {
  static Future<List<Restaurant>?> getAllRestaurants() async {
    final List<Restaurant> restaurants = [];

    try {
      final Uri endpoint = Uri.parse(
        'https://fakerestaurantapi.runasp.net/api/Restaurant',
      );

      final response = await http.get(endpoint);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        for (var restaurant in data) {
          restaurants.add(
            Restaurant(
              restaurantID: restaurant['restaurantID'],
              restaurantName: restaurant['restaurantName'],
              address: restaurant['address'],
              type: restaurant['type'],
            ),
          );
        }
      } else {
        throw Exception('erreur serveur');
      }
    } catch (error) {
      print(error);
      return null;
    }

    return restaurants;
  }
}
