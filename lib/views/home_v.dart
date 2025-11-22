import 'package:flutter/material.dart';
import 'package:hubert_eat/viewmodels/home_vm.dart';
import 'package:hubert_eat/views/restaurant_v.dart';
import 'package:hubert_eat/widgets/restauCard.dart';
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
          spacing: 20,
          children: [
            tagsWidget(),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    body: RestauV(title: "value.restaurantName", id: 5),
                  ),
                ),
              ),
              child: Text('test restau'),
            ),
            Restaucard(title: "Crousty"),
            Restaucard(title: "Subway"),
            Restaucard(title: "Quick"),
            Restaucard(title: "Mcdo"),
            Restaucard(title: "Burger King"),
          ],
        ),
      ),
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
