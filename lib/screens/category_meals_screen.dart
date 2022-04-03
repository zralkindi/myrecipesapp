import 'package:flutter/material.dart';
import '../widgets/recipts_item.dart';
import '../models/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;
  //
  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final filteredCat = DUMMY_RECIPTS.where((recipt) {
      return recipt.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          // return Text(filteredCat[index].title);
          return ReciptItem(
            title: filteredCat[index].title,
            affordability: filteredCat[index].affordability,
            imageUrl: filteredCat[index].imageUrl,
            duration: filteredCat[index].duration,
            complexity: filteredCat[index].complexity,
          );
        },
        itemCount: filteredCat.length,
      ),
    );
  }
}
