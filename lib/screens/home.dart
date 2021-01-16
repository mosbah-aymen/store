import 'package:flutter/material.dart';
import 'package:store_app/componants/categories.dart';
import 'package:store_app/componants/gridlist.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff004D40),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
          ),
          actions: [

            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),

          ],
        ),
        backgroundColor: Color(0xffB2DFDB),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Container(
              padding: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.vertical(top: Radius.circular(10))
              ),
              child: Text(
                'Xiaomi ',
                style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
          ),
          Categories(),
          AllProducts(),
        ]),
      ),
    );
  }
}
