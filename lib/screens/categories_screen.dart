import 'package:flutter/material.dart';
import 'package:travels2/widgets/app_drawer.dart';
import '../app_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  static const categoryScreenRoute="/categoryScreen";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 10,
                childAspectRatio: 7 / 8,
                mainAxisSpacing: 10),
            children: Categories_data.map((categoryData) => CategoryItem(
                    categoryData.id, categoryData.title, categoryData.imageUrl))
                .toList(),
          ),
      ),
    );
  }
}
