import 'package:flutter/material.dart';
import 'package:travels2/app_data.dart';
import 'package:travels2/widgets/app_drawer.dart';
import '../models/trip.dart';

import '../widgets/trip_item.dart';

class CategoryTripsScreen extends StatelessWidget {
  static const categoryScreenTripsRoute = '/category-trilate ';

   late List<Trip> avilablTrips;
   CategoryTripsScreen(this.avilablTrips);

  // final String title;
  // final String imageUrl;
  // final String id;
  //
  // const CategoryTripsScreen({super.key, required this.title, required this.imageUrl, required this.id});
  @override
  Widget build(BuildContext context) {
//
    final routsArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryId = routsArguments['id'];
    final categoryTitel = routsArguments['title'];
    final categoryImageUrl = routsArguments['imageUrl'];
    //
    final filteredTrips = avilablTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text("$categoryTitel"),
        ),
        drawer: AppDrawer(),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return TripItem(
              filteredTrips[index].id,
                filteredTrips[index].title,
                filteredTrips[index].imageUrl,
                filteredTrips[index].duration,
                filteredTrips[index].tripType,
                filteredTrips[index].season);
          },
          itemCount: filteredTrips.length,
        ));
  }
}
