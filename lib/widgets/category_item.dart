

import 'package:flutter/material.dart';
import '../screens/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  @override

  final String id;
  final String title;
  final String imageUrl;


  CategoryItem( this.id,this.title, this.imageUrl);


  selectWidget(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      CategoryTripsScreen.categoryScreenTripsRoute,
      arguments: {
        'id':id,
        'title':title,
        'imageUrl':imageUrl,

      }
    );

  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectWidget(context),
      splashColor: Colors.amber,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 250,
            ),
          ),
          Container(
            alignment: Alignment.center,
              child: Text(
            title,
            style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15)),),

        ],
      ),
    );


  }

}
