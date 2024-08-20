import 'package:flutter/material.dart';
import 'package:proj6/screens/trip.screen.dart';
import '../models/trip.dart';

class TripItem extends StatelessWidget {
  String get seasonText {
    switch (season) {
      case Season.Winter:
        {
          return 'شتاء';
        }
      case Season.Summer:
        {
          return 'صيف';
        }
      case Season.Spring:
        {
          return 'ربيع';
        }
      case Season.Autumn:
        {
          return 'خريف';
        }
      default:
        {
          return 'غير معروف';
        }
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Activities:
        {
          return 'Activities';
        }
      case TripType.Exploration:
        {
          return 'Exploration';
        }
      case TripType.Recovery:
        {
          return 'Recovery';
        }
      case TripType.Therapy:
        {
          return 'Therapy';
        }
      default:
        {
          return 'غير معروف';
        }
    }
  }

  const TripItem(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.season,
      required this.tripType,
      required this.id});
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Season season;
  final TripType tripType;

  @override
  Widget build(BuildContext context) {
    void selectTrip() {
      Navigator.of(context)
          .pushNamed(TripDetailsScreen.tripDetailsScreenRoute, arguments: {
        'id': id,
        // 'imageUrl': imageUrl,
      });
    }

    return InkWell(
      onTap: selectTrip,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.8),
                        ],
                        stops: const [
                          0.6,
                          1
                        ]),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineLarge,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Days(duration: duration),
                  TheSeason(seasonText: seasonText),
                  ActivityWidget(tripTypeText: tripTypeText)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({
    super.key,
    required this.tripTypeText,
  });

  final String tripTypeText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.family_restroom,
            color: Theme.of(context).secondaryHeaderColor),
        Text(tripTypeText),
      ],
    );
  }
}

class TheSeason extends StatelessWidget {
  const TheSeason({
    super.key,
    required this.seasonText,
  });

  final String seasonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.wb_sunny, color: Theme.of(context).secondaryHeaderColor),
        Text(seasonText),
      ],
    );
  }
}

class Days extends StatelessWidget {
  const Days({
    super.key,
    required this.duration,
  });

  final int duration;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.today, color: Theme.of(context).secondaryHeaderColor),
        Text('$duration ايام'),
      ],
    );
  }
}
