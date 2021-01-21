import 'package:flutter/material.dart';

class Product {
  String title, imagePath;
  double price, rate;
  List<Color> colorExist = [];
  Product(
      {this.price,
      this.rate,
      this.title,
      @required this.imagePath,
      this.colorExist});
}

class ProductCard extends StatelessWidget {
  final Product product;
 final Function onclick;
  ProductCard({@required this.product, this.onclick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(18)),
        margin: EdgeInsets.all(6),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image(
                  image: AssetImage(product.imagePath),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Text(
                      product.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(child: SizedBox()),
                      Text(
                        product.price.toString() + '£',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
