import 'package:flutter/material.dart';
import 'package:proj6/screens/category.trips.screen.dart';
import 'package:proj6/screens/categroy.screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proj6/screens/trip.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        secondaryHeaderColor: Colors.amber,
        fontFamily: 'Amiri',
        textTheme: ThemeData.light().textTheme.copyWith(
            headlineMedium: const TextStyle(
              fontSize: 24,
              fontFamily: 'ElMessiri',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            headlineLarge: const TextStyle(
              fontSize: 26,
              fontFamily: 'ElMessiri',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: const CategoriesScreen(),

      initialRoute: '/',
      routes: {
        '/': (ctx) => const CategoriesScreen(),
        CategoryTripsScreen.tripsRoute: (ctx) => CategoryTripsScreen(),
        TripDetailsScreen.tripDetailsScreenRoute:(ctx)=>TripDetailsScreen(),
      },
    );
  }
}
