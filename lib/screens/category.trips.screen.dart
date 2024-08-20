import 'package:flutter/material.dart';
import 'package:proj6/app_data.dart';
import 'package:proj6/widgets/trip.card.dart';

class CategoryTripsScreen extends StatelessWidget {
  static const tripsRoute = '/category-trips';

  const CategoryTripsScreen({super.key});
  @override
  Widget build(BuildContext context) {
//
    final routeAgrument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeAgrument['id'];
    final categoryTitle = routeAgrument['title'];
    final filteredTrips = Trips_data.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
//

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ?? 'Default Title',
            style: Theme.of(context).textTheme.headlineLarge),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: filteredTrips.length,
        itemBuilder: (ctx, index) {
          return TripItem(
            id: filteredTrips[index].id,
            title: filteredTrips[index].title,
            imageUrl: filteredTrips[index].imageUrl,
            duration: filteredTrips[index].duration,
            season: filteredTrips[index].season,
            tripType: filteredTrips[index].tripType,
          );
        },
      ),
    );
  }
}







// class CategoryTripsScreen extends StatelessWidget {
//   final String categoryId;
//   final String categoryTitle;
//   const CategoryTripsScreen(this.categoryId, this.categoryTitle);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(categoryTitle,
//             style: Theme.of(context).textTheme.headlineMedium),
//         backgroundColor: Theme.of(context).primaryColor,
//       ),
//       body: const Center(
//         child: Text('قائمه الرحلات'),
//       ),
//     );
//   }
// }
