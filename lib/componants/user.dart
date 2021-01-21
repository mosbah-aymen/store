import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final _auth = FirebaseAuth.instance;
User loggedInUser;

final kMyUser = _auth.currentUser;
FirebaseFirestore firestore = FirebaseFirestore.instance;
