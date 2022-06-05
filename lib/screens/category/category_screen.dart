
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/product_getx_controller.dart';
import '../../utils/Product_card.dart';
import '../../utils/app_text.dart';
import '../Product/DetailsScreen.dart';
class category_screen extends StatefulWidget {
late String categoryName ;

category_screen({required this.categoryName});

  @override
  State<category_screen> createState() => _category_screenState();
}

class _category_screenState extends State<category_screen> {







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        centerTitle: true,
        title: AppText(
          text: widget.categoryName,
          fontWeight: FontWeight.bold,
          fontsize: 20,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          child: GetX<ProductGetxController>(
            builder: (ProductGetxController controller) {
              return controller.loading.value
                  ? Center(
                child: CircularProgressIndicator()
              )
                  : controller.products.isNotEmpty
                  ? GridView.builder(
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 152 / 266,
                ),
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return Product_card(
                      product: controller.products[index],
                      onTap: () => Get.to(
                        DetailsScreen(
                            productDetails:
                            controller.products[index]),
                      ));
                },
              )
                  : Center(
                child:Text( ' There is no product '),
              );
            },
          ),
        ),
      ),

    );
  }
}
