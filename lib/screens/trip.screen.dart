import 'package:flutter/material.dart';

class TripDetailsScreen extends StatelessWidget {
  static const tripDetailsScreenRoute = '/details-screen';
  const TripDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeAgrument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final tripId = routeAgrument['id'];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            tripId ?? 'lol',
          ),
        ),
        body:const Text('صفحه الرحلات'));
  }
}
