import 'package:flutter/material.dart';
import 'package:hubert_eat/models/restaurant.dart';
import 'package:hubert_eat/widgets/restauCard.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 250),
            Center(child: Restaucard(title: 'Crousty Sabaidi')),
          ],
        ),
      ),
    );
  }
}
