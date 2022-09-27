import 'package:flutter/material.dart';
import 'package:travels2/models/trip.dart';
import 'package:travels2/screens/trips_detail_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;

  const TripItem(@required this.id,@required this.title, @required this.imageUrl,
      @required this.duration, @required this.tripType, @required this.season);



  String get seasonText{

    switch (season){
      case Season.Winter:
        return 'شتاء';
        break;
        case Season.Summer:
      return 'صيف';
      break;
      case Season.Spring:
        return 'ربيع';
        break;
      case Season.Autumn:
        return 'خريف';
        break;
      default:
        return 'غير معروف';

    }
  }

  String get tripTypeText{

    switch (tripType){

      case TripType.Therapy:

        return 'معالجة';
        break;
      case TripType.Recovery:
        return 'نقاهة';
        break;
      case TripType.Exploration:
        return 'استكشاف';
        break;
      case TripType.Activities:
        return 'انشطة';
        break;
      default:
        return 'غير معروف';

    }
  }

  void selectTrip(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(TripDetailScreen.tripDetailScreen,
    arguments: id).then((result) => {

    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectTrip(context),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 7,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.8)
                    ], begin: Alignment.center, end: Alignment.bottomCenter)),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    height: 250,
                    alignment: Alignment.bottomRight,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          overflow: TextOverflow.fade),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$duration أيام ")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$tripTypeText")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.sunny,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$seasonText  ")
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }
}
