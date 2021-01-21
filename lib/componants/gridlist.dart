import 'package:flutter/material.dart';
import 'prod_card.dart';
import 'package:store_app/stores/store1.dart';
import 'package:store_app/screens/details.dart';
class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 10,
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.79),

        itemBuilder: (context, index) =>ProductCard(product: products[index],onclick: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(
            product: products[index],
          )));
        },),
      ),
    );
  }
}