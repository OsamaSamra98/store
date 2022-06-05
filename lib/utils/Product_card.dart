import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/product_details.dart';

class Product_card extends StatelessWidget {
  final void Function() onTap;
  final ProductDetails product;


  Product_card({
    required this.onTap,
    required this.product,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Container(
        width: 160,
        height: 200,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.06),
              spreadRadius: 5,
              blurRadius: 6,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Container(
                //     width: 152,
                //     height: 150,
                //     clipBehavior: Clip.antiAlias,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(15),
                //       color: Colors.grey,
                //     ),
                //     child: child),
                Positioned(
                  right: 5,
                  bottom: 100,
                  child: Center(
                    child: IconButton(
                        onPressed: () {},
                        icon:  Icon(
                          Icons.favorite_border,
                          color: Colors.black45,
                        )),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '${product.title}',
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NunitoSans'),
            ),
            Text(
              '${product.description}',
              style: TextStyle(
                  fontSize: 11,
                  color: Colors.black45,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'NunitoSans'),
            ),
            SizedBox(
              height: 10,
            ),
            RatingBar.builder(
              initialRating:5,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemSize: 20,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {

              },
            ),

            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('SAR ${product.price}'), Icon(Icons.shopping_bag)],
            ),
          ],
        ),
      ),
    );
  }
}
