import 'package:flutter/material.dart';
import 'package:hubert_eat/models/restaurant.dart';

void main() async {
  await RestaurantRepo.getAllRestaurants();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
