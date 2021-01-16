import 'package:flutter/cupertino.dart';
import 'package:store_app/stores/store1.dart';
import 'package:store_app/screens/home.dart';
import 'constants.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'home',
      routes: {
        'home' : (context)=> HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}

