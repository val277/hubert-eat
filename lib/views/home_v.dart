import 'package:flutter/material.dart';
import 'package:hubert_eat/models/restaurant.dart';
import 'package:hubert_eat/viewmodels/home_vm.dart';
import 'package:hubert_eat/widgets/restauCard.dart';
import 'package:hubert_eat/widgets/scrollable_restau_card.dart';
import 'package:provider/provider.dart';

class HomeV extends StatefulWidget {
  const HomeV({super.key});

  @override
  State<HomeV> createState() => _HomeVState();
}

class _HomeVState extends State<HomeV> {
  @override
  void initState() {
    super.initState();
    context.read<HomeVm>().fetchRestaurants();
  }

  String _selectedTag = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            tagsWidget(),
            ScrollableRestauCard(
              title: "À découvrir sur Hubert Eat",
              numberOfRestaurants: 5,
            ),
            ScrollableRestauCard(
              title: "Lieux susceptibles de vous\n intéresser",
              numberOfRestaurants: 5,
            ),
            ScrollableRestauCard(
              title: "Adapté à vos goûts",
              numberOfRestaurants: 10,
            ),
            allRestaurantsWidget(),
          ],
        ),
      ),
    );
  }

  Widget allRestaurantsWidget() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "Tous les établissements",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        Consumer<HomeVm>(
          builder: (context, viewModel, child) => viewModel.restaurants.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  spacing: 8,
                  children: [
                    ...List.generate(
                      viewModel.restaurants.length,
                      (index) => Restaucard(
                        title: viewModel.restaurants[index].restaurantName,
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }

  Widget tagsWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: Consumer<HomeVm>(
          builder: (context, viewModel, child) {
            List<String> tags = viewModel.getTags();
            return viewModel.restaurants.isEmpty
                ? const Center(child: Text("No tags available"))
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tags.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ChoiceChip(
                        label: Text(tags[index]),
                        selected: _selectedTag == tags[index],
                        onSelected: (bool selected) {
                          setState(() {
                            _selectedTag = selected ? tags[index] : "";
                          });
                        },
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
