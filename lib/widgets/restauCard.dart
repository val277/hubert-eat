import 'package:flutter/material.dart';
import 'dart:math';

class Restaucard extends StatelessWidget {
  final String title;

  const Restaucard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final avis = 1 + Random().nextDouble() * (5 - 1);
    final int nombreAvis = Random().nextInt(9991) + 10;
    final double frais = Random().nextDouble() * 5;
    final int time = Random().nextInt(21) + 30;

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 130,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(15),
                child: Image.network(
                  "https://placehold.co/600x400.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'frais de livraison à ${frais.toStringAsFixed(2)} € - $time min',
            ),
            Text('${avis.toStringAsFixed(1)}⭐ ($nombreAvis+ )'),
          ],
        ),
      ),
    );
  }
}
