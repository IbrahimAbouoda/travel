import 'package:flutter/material.dart';
import 'package:travels2/app_data.dart';
import 'package:travels2/widgets/app_drawer.dart';

class TripDetailScreen extends StatelessWidget {
  static const tripDetailScreen = '/screenDetails';


  Widget buildSectionTitle(BuildContext context,String titleText){
    return
      Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        alignment: Alignment.topRight,
        child: Text(titleText,
          style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
      );
  }

  Widget bulidListView(Widget child){
    return  Container(
        decoration: BoxDecoration(
        color: Colors.white,
        border:Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(10),

    ),
    padding: EdgeInsets.all(10),
    margin: const EdgeInsets.symmetric(horizontal: 15),
    height: 200,
    child: child,);
  }


  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    final selectTrip = Trips_data.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectTrip.title}'),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                selectTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),

            buildSectionTitle(context, 'الانشطة'),

              bulidListView(
                ListView.builder(
                  itemCount: selectTrip.activities.length,
                  itemBuilder: (context, index) => Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(selectTrip.activities[index]),
                        ),
                      )),
            ),
            buildSectionTitle(context, 'البرنامج اليومي') ,
            bulidListView(
              ListView.builder(
                itemCount: selectTrip.program.length,
                  itemBuilder:
                  (context,index)=>Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('يوم ${index +1}'),
                        ),
                        title: Text(selectTrip.program[index]),
                      ),
                      Divider(),
                    ],
                  ),
              ),
            ),
            SizedBox(height: 100,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: Icon(Icons.delete,color:Colors.blue,),
        onPressed: (){
          Navigator.of(context).pop(tripId);
        },
      ),
    );
  }
}
