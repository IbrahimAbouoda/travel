import 'package:flutter/material.dart';
import 'package:travels2/widgets/app_drawer.dart';
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  static const FavoritesScreenRoute='/fav';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    drawer: AppDrawer(),);
  }
}
