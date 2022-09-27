import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:  ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
         DrawerHeader(

          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child:
          Column(children: [
          Container(
            height: 100,
              width: 100,
              child:CircleAvatar(backgroundImage: AssetImage('images/t.jpg'),)),
            Text("دليل سياحي",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)

          ],

          ),
        ),

        ListTile(
          leading: Icon(Icons.card_travel,color: Colors.amber,),
          title: const Text('التصنيفات',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(CategoriesScreen.categoryScreenRoute);
          },
        ),
        ListTile(
          leading: Icon(Icons.favorite,color: Colors.amber,),
          title: const Text("المفضلة",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24)),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(FavoritesScreen.FavoritesScreenRoute);
          },
        ),
        ListTile(
          leading: Icon(Icons.filter_list,color: Colors.amber,),
          title: const Text("الفلترة",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24)),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.filterScreenRoute);
          },
        ),
      ],
    ),
    );
  }
}
