import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String itemName;
  final String itemDescription;
  final double itemPrice;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.itemName,
    required this.itemDescription,
    required this.itemPrice,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Row(
        children: [
          SingleChildScrollView(
            child: Expanded(
              flex: 4,
              child: Column(
                children: [
                  Text(
                    itemName,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$itemPrice €',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  Text(itemDescription),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(15),
              child: Image.network(imageUrl),
            ),
          ),
        ],
      ),
    );
  }
}
