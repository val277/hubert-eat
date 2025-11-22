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
    return restaurants.isEmpty
        ? []
        : restaurants.map((restau) => restau.type).toSet().toList();
  }
}
