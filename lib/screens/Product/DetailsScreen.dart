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
  bool isFavorite = false;

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 65, vertical: 80),
        child: Container(
          child: CachedNetworkImage(
            imageUrl: '${widget.productDetails.image}',
            fit: BoxFit.cover,
          ),
        ),
      ),
      bottomSheet: Container(
        height: 355,
        width: 400,
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
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 300,
                  child: Text(
                    '${widget.productDetails.title}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating:
                          widget.productDetails.rating.rate!.toDouble(),
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
                      onRatingUpdate: (rating) {},
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          widget.productDetails.favorite =
                              !widget.productDetails.favorite;
                          setState(() {});
                        },
                        icon: !widget.productDetails.favorite
                            ? Icon(
                                Icons.favorite_border,
                                color: Colors.black45,
                                size: 40,
                              )
                            : Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 40,
                              ))
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
                Text('${widget.productDetails.description}'),
                SizedBox(
                  height: 15,
                ),
                Text('Price : ${widget.productDetails.price} \$',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () async {},
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
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
