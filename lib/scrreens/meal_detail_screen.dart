import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScree extends StatelessWidget {
  const MealDetailScree({super.key});

  Widget _createSevtionText(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "Ingredientes",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Container _createSectionContainer(Widget child) {
    return Container(
      width: 300,
      height: 200,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSevtionText(context, 'Ingredientes'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (_, index) {
                  return Card(
                    color: Theme.of(context).secondaryHeaderColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        meal.ingredients[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            _createSectionContainer(ListView.builder(
              itemCount: meal.steps.length,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(
                        meal.steps[index],
                      ),
                    ),
                    const Divider()
                  ],
                );
              },
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(meal.title);
        },
        child: const Icon(Icons.star),
      ),
    );
  }
}
