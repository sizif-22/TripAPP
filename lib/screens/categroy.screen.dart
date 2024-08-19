import 'package:flutter/material.dart';

import 'package:proj6/app_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'دليل سياحي',
          style: Theme.of(context).textTheme.headlineLarge,
        )),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: Categories_data.map((categorData) => CategoryItem(
            categorData.id, categorData.title, categorData.imageUrl)).toList(),
      ),
    );
  }
}
