
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Registration extends StatefulWidget {

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  final  _auth = FirebaseAuth.instance;
  String email, password, error;
  List<String> emailsEntered = [];
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  bool _isAsync = false;
  var _sugController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: ModalProgressHUD(
          inAsyncCall: _isAsync,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 150),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: AutoCompleteTextField(
                    key: key,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        gapPadding: 10,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      hintText: 'Enter your email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    suggestions: emailsEntered,
                    controller: _sugController,
                    itemFilter: (item, query) {
                      return item.toLowerCase().startsWith(query.toLowerCase());
                    },
                    itemSorter: (a, b) {
                      return a.compareTo(b);
                    },
                    clearOnSubmit: false,
                    itemSubmitted: (item) {
                      _sugController.text = item;
                      print('item $item');
                    },
                    submitOnSuggestionTap: true,
                    itemBuilder: (contex, item) {
                      return Container(
                        child: Row(
                          children: [
                            Text(item),
                          ],
                        ),
                        padding: EdgeInsets.all(20),
                      );
                    },
                    textChanged: (em) {
                      email = em;
                    },
                    style: TextStyle(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.enhanced_encryption_rounded),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        gapPadding: 10,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      helperText: error,
                      hintText: 'Enter your password',
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (em) {
                      password = em;
                    },
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50)),
                        width: 150,
                        height: 50,
                        child: Center(
                            child: Text(
                          'SignIn',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        )),
                      ),
                      onTap: () async {
                        setState(() {
                          _isAsync = true;
                        });
                        try {
                          emailsEntered.add(email);
                          await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          Navigator.pushNamed(context, 'profile');
                        } catch (e) {
                          error = e;
                        }
                        setState(() {
                          _isAsync = false;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50)),
                        width: 150,
                        height: 50,
                        child: Center(
                            child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        )),
                      ),
                      onTap: () async {
                        setState(() {
                          _isAsync = true;
                        });
                        try {
                          final newuser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          emailsEntered.add(email);
                          if (newuser != null) {
                            Navigator.pushNamed(context, 'profile');
                            setState(() {
                              _isAsync = false;
                            });
                          }
                        } catch (e) {
                          print(e);

                          error = e;
                        }


                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
