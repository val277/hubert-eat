import 'package:flutter/material.dart';
import 'dart:math';

import 'package:hubert_eat/viewmodels/home_vm.dart';
import 'package:hubert_eat/views/restaurant_v.dart';

class Restaucard extends StatefulWidget {
  final int id;
  final String title;
  final double width;

  const Restaucard({
    super.key,
    required this.title,
    required this.id,
    this.width = double.infinity,
  });

  @override
  State<Restaucard> createState() => _RestaucardState();
}

class _RestaucardState extends State<Restaucard> {
  String image = "https://placehold.co/600x400.png";

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  Future<void> loadImage() async {
    var temp = await HomeVm.getImage();
    if (temp != null) {
      setState(() {
        image = temp;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final avis = 1 + Random().nextDouble() * (5 - 1);
    final int nombreAvis = Random().nextInt(9991) + 10;
    final double frais = Random().nextDouble() * 5;
    final int time = Random().nextInt(21) + 30;

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              RestauV(title: widget.title, id: widget.id, image: image),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: SizedBox(
          width: widget.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 130,
                width: widget.width,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(15),
                  child: Image.network(image, fit: BoxFit.cover),
                ),
              ),
              Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'frais de livraison à ${frais.toStringAsFixed(2)} € - $time min',
              ),
              Text('${avis.toStringAsFixed(1)}⭐ ($nombreAvis+ )'),
            ],
          ),
        ),
      ),
    );
  }
}
