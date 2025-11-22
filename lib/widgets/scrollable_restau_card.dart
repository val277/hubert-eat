import 'package:flutter/material.dart';
import 'package:hubert_eat/models/restaurant.dart';
import 'package:hubert_eat/viewmodels/home_vm.dart';
import 'package:provider/provider.dart';
import 'package:hubert_eat/widgets/restauCard.dart';

class ScrollableRestauCard extends StatelessWidget {
  final String title;
  final int numberOfRestaurants;
  const ScrollableRestauCard({
    super.key,
    required this.title,
    required this.numberOfRestaurants,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: AspectRatio(
        aspectRatio: 13 / 9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
              child: Consumer<HomeVm>(
                builder: (context, viewModel, child) {
                  List<Restaurant> restaurants = viewModel.getRandomRestaurants(
                    numberOfRestaurants,
                  );
                  return viewModel.restaurants.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: restaurants.length,
                          itemBuilder: (context, index) => Restaucard(
                            title: restaurants[index].restaurantName,
                            width: 300,
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
