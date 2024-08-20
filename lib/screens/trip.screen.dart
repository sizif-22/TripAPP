import 'package:flutter/material.dart';
import 'package:proj6/app_data.dart';

class TripDetailsScreen extends StatelessWidget {
  static const tripDetailsScreenRoute = '/details-screen';
  const TripDetailsScreen({super.key});

  Widget theTitle(BuildContext context, String title) {
    return Container(
      alignment: Alignment.topRight,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget buildListViewContainter(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      height: 200,
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeAgrument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final tripId = routeAgrument['id'];
    // final imageUrl = routeAgrument['imageUrl'];
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);
    final imageUrl = selectedTrip.imageUrl;
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedTrip.title),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                theTitle(context, 'الانشطة'),
                buildListViewContainter(
                  ListView.builder(
                    itemCount: selectedTrip.activities.length,
                    itemBuilder: (ctx, index) => Card(
                      elevation: 0.3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(
                          selectedTrip.activities[index],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                theTitle(context, 'البرنامج اليومي'),
                buildListViewContainter(
                  ListView.builder(
                      itemCount: selectedTrip.program.length,
                      itemBuilder: (context, index) =>
                          // Card(
                          //   elevation: 0.3,
                          //   child: Padding(
                          //     padding: const EdgeInsets.symmetric(
                          //       vertical: 5,
                          //       horizontal: 10
                          //     ),
                          //     child: Text(selectedTrip.program[index]),
                          //   ),
                          // ),
                          Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).secondaryHeaderColor,
                                  child: Text(
                                    'يوم ${index + 1}',
                                  ),
                                ),
                                title: Text(
                                  selectedTrip.program[index],
                                ),
                              ),
                              const Divider(),
                            ],
                          )),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            )
          ],
        ));
  }
}
