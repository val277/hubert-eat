import 'package:flutter/material.dart';
import 'package:hubert_eat/models/item.dart';
import 'dart:math';

import 'package:hubert_eat/viewmodels/restaurant_vm.dart';
import 'package:hubert_eat/widgets/productCard.dart';

class RestauV extends StatefulWidget {
  final String title;
  final int id;
  const RestauV({super.key, required this.title, required this.id});

  @override
  State<RestauV> createState() => _RestauVState();
}

class _RestauVState extends State<RestauV> {
  final avis = 1 + Random().nextDouble() * (5 - 1);
  final int nombreAvis = Random().nextInt(9991) + 10;
  final double km = 1 + Random().nextDouble() * (10 - 1);
  final int fidele = Random().nextInt(9991) + 10;

  List<Item> products = [];

  @override
  void initState() {
    super.initState();
    loadMenu();
  }

  Future<void> loadMenu() async {
    var futureProducts = await RestaurantVm.fetchMenu(widget.id);
    setState(() {
      products = futureProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.network(
                  "https://placehold.co/600x400.png",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${avis.toStringAsFixed(1)}⭐ ($nombreAvis+) - ${km.toStringAsFixed(1)} km',
                    ),
                    Text(
                      'Paiement par Swile, Ticket Restaurant, UpDéjeuner, et Bimpli (ex Apetiz) accepté',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.green[100],
                        ),
                        child: Text(
                          style: TextStyle(
                            color: const Color.fromARGB(255, 4, 78, 7),
                          ),
                          '$fidele+ clients fidèles',
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          itemName: products[index].itemName,
                          itemDescription: products[index].itemDescription,
                          itemPrice: products[index].itemPrice,
                          imageUrl: products[index].imageUrl,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
