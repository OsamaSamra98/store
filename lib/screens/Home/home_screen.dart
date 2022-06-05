import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/api/helper/api_mixin.dart';
import 'package:store/getx/product_getx_controller.dart';
import 'package:store/screens/category/category_screen.dart';
import 'package:store/utils/Product_card.dart';

import '../../api/api_settings.dart';
import 'package:http/http.dart' as http;

import '../profile.dart';

class home_Screen extends StatefulWidget {
  @override
  State<home_Screen> createState() => _home_ScreenState();
}

List category = [
  'Sofas',
  'Wardrobe',
  'BED',
  'Desk & Table',
];

class _home_ScreenState extends State<home_Screen> with ApiMixin {
  var response;

  Future<List> getCategory() async {
    response = await http.get(getUrl(ApiSettings.CATEGORY), headers: header);

    return [];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F8FF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Divider(color: Colors.transparent),
              GestureDetector(
                onTap: (){
                  Get.to(category_screen(categoryName: 'test'));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Spacer(),
                    Column(
                      children: [
                        SizedBox(height: 30),
                        Text('Sofa ',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        Text('THE Modern Furniture ',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    SizedBox(width: 50),
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5)),
                        child: IconButton(
                            onPressed: () {
                              Get.to(profile_screen());
                            },
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            )))
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent),
                clipBehavior: Clip.antiAlias,
                child: TextField(
                  cursorColor: Colors.black,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                        fontSize: 16.5, color: Colors.grey.withOpacity(0.50)),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.025),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.50),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.50),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Image.asset('images/offer.jpg',
                  height: 180, width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 15),
              Text(
                'SHOP BY CATEGORY',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 15,
                    );
                  },
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Chip(label: Text(category[index])),
                    );


                  },
                ),
              ),
              SizedBox(height: 15),
              Text('OUR BEST SELLERS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              SizedBox(height: 20),

              GetX<ProductGetxController>(
                builder: (ProductGetxController controller) {
                  return controller.products.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {},
                                child: Product_card(
                                  onTap: () {},
                                  product: controller.products[index],
                                ));

                            // CategoryWidget(
                            //   category: controller.categories[index],
                            //   onTap: () => Get.to(
                            //       ''));
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 15,
                            );
                          },
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
