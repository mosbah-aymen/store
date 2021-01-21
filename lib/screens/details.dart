import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/componants/prod_card.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:store_app/componants/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:store_app/screens/profile.dart';
class ProductDetails extends StatelessWidget {
  final Product product;
  final int id=0;
  const ProductDetails({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final myCollecton = firestore.collection('shoppingCart');
   final cart = myCollecton;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 65.0,
        width: 65.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'BUY NOW',
                style: TextStyle(color: Colors.white),
              ),
            ),
            // elevation: 5.0,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 75,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.search),
                onPressed: () {
                  // myCollecton.doc().get().then((value) => (DocumentSnapshot snpahot ){
                  //   print(snpahot.exists);
                  // });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                       myCollecton.add({
                         'buyer': kMyUser.email,
                         'productid': product.title,
                       });
                   firestore.collection('shoppingCart').doc().id ;

                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.storefront),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
      // appBar: AppBar(
      //   actions: [
      //     IconButton(icon: Icon(Icons.search), onPressed: () {}),
      //     IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
      //     IconButton(
      //       iconSize: 35,
      //       color: Colors.white,
      //       icon: Icon(Icons.storefront),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Image(
                  image: AssetImage(product.imagePath),
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(20))),
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          product.price.toString() + ' \$',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.title,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[200],
    );
  }
}
