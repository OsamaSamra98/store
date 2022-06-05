import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:get/get.dart';

import '../../getx/product_getx_controller.dart';
import '../../models/product_details.dart';
import '../../utils/app_text.dart';

class DetailsScreen extends StatefulWidget {
  final ProductDetails productDetails;

  DetailsScreen({required this.productDetails});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int cardIncrement = 1;
bool isFavorite =false;
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await ProductGetxController.to
          .getProductDetails(id: widget.productDetails.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart_screen');
              },
              icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 65,
            vertical: 30),
        child: Container(
          height: 280,
          width: 280,
          child: CachedNetworkImage(imageUrl: '${widget.productDetails.image}',fit: BoxFit.cover,),
        ),
      ),
      bottomSheet: Container(
        height: 355,
        width:400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 10)
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  AppText(
                    text: '${widget.productDetails.title}',
                    fontsize: 18,
                    fontWeight: FontWeight.bold,
                    color:Colors.black,
                    letterSpacing: 1,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () async {
                      isFavorite =!isFavorite;
                      setState(() {

                      });
                    },
                    child: Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isFavorite
                              ? Colors.red
                              : Colors.grey),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: 3.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemSize: 30,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {

                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),

                ],
              ),
              SizedBox(
                height: 15,
              ),

              AppText(
                text: 'Description : ',
                fontsize: 20,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                 '${widget.productDetails.description}'
              ),
              Spacer(),
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () async {

                      },
                      child: AppText(
                        text: 'Add To Cart'.tr,
                        color: Colors.white,
                        fontsize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          minimumSize: Size(double.infinity, 64),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 125,
                    child: Row(
                      children: [
                        FloatingActionButton(
                          backgroundColor: Colors.black,
                          mini: true,
                          onPressed: () {
                            setState(() {
                              ++cardIncrement;
                            });
                          },
                          child: Icon(
                            Icons.add,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppText(
                            text: cardIncrement.toString(),
                          ),
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.black,
                          mini: true,
                          onPressed: () {
                            setState(() {
                              cardIncrement == 1 ? 1 : --cardIncrement;
                            });
                          },
                          child: Icon(
                            Icons.remove,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height:15
              ),
            ],
          ),
        ),
      ),
    );
  }



}
