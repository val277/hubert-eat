import 'package:flutter/material.dart';
import 'package:hubert_eat/views/cart_v.dart';
import 'package:hubert_eat/views/home_v.dart';
import 'package:hubert_eat/views/orders_v.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [HomeV(), CartV(), OrdersV()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black12)),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: "Accueil",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart_rounded),
              label: "Panier",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.insert_chart_outlined_rounded),
              label: "Commandes",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (value) => setState(() {
            _selectedIndex = value;
          }),
          selectedItemColor: Colors.black87,
        ),
      ),
    );
  }
}
