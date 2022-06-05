import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/product_details.dart';

class Product_card extends StatefulWidget {
  final void Function() onTap;
  final ProductDetails product;


  Product_card({
    required this.onTap,
    required this.product,

  });

  @override
  State<Product_card> createState() => _Product_cardState();
}

class _Product_cardState extends State<Product_card> {




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap:widget.onTap ,
        child: Container(
          width: 160,
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
                  Container(
                      width: 152,
                      height: 150,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey,
                      ),
                      child: CachedNetworkImage(imageUrl: '${widget.product.image}',fit: BoxFit.fill,),


                  ),
                  Positioned(
                    right: 5,
                    bottom: 100,
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            widget.product.favorite=!widget.product.favorite;
                            setState(() {

                            });
                          },
                          icon: !widget.product.favorite? Icon(
                            Icons.favorite_border,
                            color: Colors.black45,
                          ):Icon(
                            Icons.favorite,
                            color: Colors.red,

                          ))
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(width: 150,
                child: Text(
                  '${widget.product.title}',overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NunitoSans'),
                ),
              ), SizedBox(
                height: 15,
              ),
              SizedBox(width: 150,
                child: Text(
                  '${widget.product.description}',overflow: TextOverflow.clip,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'NunitoSans'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RatingBar.builder(
                initialRating:widget.product.rating.rate!.toDouble(),
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
                children: [Text(' ${widget.product.price} \$'), Icon(Icons.shopping_bag)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
