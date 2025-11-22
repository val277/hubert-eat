import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hubert_eat/models/restaurant.dart';

class HomeVm extends ChangeNotifier {
  List<Restaurant> restaurants = [];

  Future<void> fetchRestaurants() async {
    var temp = await RestaurantRepo.getAllRestaurants();
    if (temp != null) {
      restaurants = temp;
      notifyListeners();
    }
  }

  List<String> getTags() {
    return restaurants.map((restau) => restau.type).toSet().toList();
  }

  List<Restaurant> getRandomRestaurants(int n) {
    List<Restaurant> temp = restaurants;
    temp.shuffle();
    return temp.take(n).toList();
  }

  static Future<String?> getImage() async {
    try {
      Uri url = Uri.https("foodish-api.com", "api");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return jsonDecode(response.body)["image"] as String;
      } else {
        throw Exception("Erreur API");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
