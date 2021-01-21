import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {

  @override
  _ProfileState createState ()  => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _auth = FirebaseAuth.instance;
  User loggedInUser;
  String userEmail='';
  @override
  void initState(){
    getThisUser();
    super.initState();

  }

  void getThisUser() async{
    try {
      var  user = await _auth.currentUser;
     if (user != null) {
       loggedInUser= await user;
       print(loggedInUser.email);
       userEmail =  loggedInUser.email;
       print(userEmail);
     }
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Row(
            children: [
              Icon(Icons.email),
            //  Text(userEmail),
            ],
          ),
          GestureDetector(
            child: Container(
              height: 50,
              width: 150,
              child: Text('Xiaomi'),

            ),
            onTap: (){
              Navigator.pushNamed(context, 'home');
            },
          )
        ],
      ),
    );
  }
}
