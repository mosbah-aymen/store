import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';



class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;
  List<String> categories = kcategory;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))
      ),
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: selectedIndex == index ? kcategoryColor : Colors.black26,
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              width: 30,
              height: 2,
              color:
              selectedIndex == index ? kcategoryColor : Colors.transparent,
            ),

          ],
        ),
      ),
    );
  }
}