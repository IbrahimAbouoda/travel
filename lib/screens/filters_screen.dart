import 'package:flutter/material.dart';
import 'package:travels2/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {


  static const filterScreenRoute = '/flitersRoute';

  final Function saveFilters;
  FiltersScreen(this.saveFilters);


  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isSummer = false;
  var _isWinter = false;
  var _isFamily = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("فلترة"),
        actions: [

          IconButton(onPressed: widget.saveFilters()
            , icon: Icon(Icons.save),)

        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                    title: Text("الرحلات الصيفية"),
                    subtitle: Text("اظهار الرحلات الصيقة فقط"),
                    value: _isSummer,
                    onChanged: (bool value) {
                      _isSummer = value;
                    }),
                SwitchListTile(
                    title: Text("الرحلات الشتوية "),
                    subtitle: Text("اظهار الرحلات الشتوية فقط"),
                    value: _isSummer,
                    onChanged: (bool value) {
                      _isSummer = value;
                    }),
                SwitchListTile(
                    title: Text("الرحلات العائلية"),
                    subtitle: Text("اظهار الرحلات العائلية فقط"),
                    value: _isSummer,
                    onChanged: (bool value) {
                      _isSummer = value;
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
