import 'package:flutter/material.dart';
import 'package:proj6/screens/category.trips.screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  CategoryItem(this.id, this.title, this.imageUrl);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryTripsScreen.tripsRoute, arguments: {
      'id': id,
      'title': title,
    });
  }

  // void selectCategory(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (c) => CategoryTripsScreen(id, title),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.4),
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          )
        ],
      ),
    );
  }
}
