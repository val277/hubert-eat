import 'package:flutter/material.dart';

class Restaucard extends StatelessWidget {
  String title;
  double frais;
  double avis;
  int time;
  Restaucard({
    super.key,
    required this.title,
    required this.frais,
    required this.avis,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 130,
            width: 250,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(15),
              child: Image.network("https://placehold.co/90x70.png"),
            ),
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text('frais de livraison à $frais € - $time min'),
                Text('$avis ⭐'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
