import 'package:flutter/material.dart';
import 'package:travels2/app_data.dart';
import 'package:travels2/screens/categories_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travels2/screens/category_trips_screen.dart';
import 'package:travels2/screens/favorites_screen.dart';
import 'package:travels2/screens/filters_screen.dart';
import 'package:travels2/screens/taps_screen.dart';
import '../screens/trips_detail_screen.dart';
import 'models/trip.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatefulWidget {


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool>filters={
    'summer': false,
    'winter':false,
    'family':false
  };


  List<Trip>_avilableTrips=Trips_data;
  void _changeFilters(Map<String,bool>filtersData)
  {


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'), // English, no country code
      ],
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
         home: TapsScreen(),

      routes:  {
        CategoriesScreen.categoryScreenRoute:(ctx)=>CategoriesScreen(),
        TripDetailScreen.tripDetailScreen:(ctx)=>TripDetailScreen(),
        CategoryTripsScreen.categoryScreenTripsRoute:(ctx)=>CategoryTripsScreen(_avilableTrips),
        FiltersScreen.filterScreenRoute:(ctx)=>FiltersScreen(_changeFilters),
        FavoritesScreen.FavoritesScreenRoute:(ctx)=>FavoritesScreen()
      },
    );
  }
}
