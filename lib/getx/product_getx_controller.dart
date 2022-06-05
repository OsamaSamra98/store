
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../api/controllers/product_api_controller.dart';
import '../models/product_details.dart';



class ProductGetxController extends GetxController {
  final ProductApiController productApiController = ProductApiController();
  RxList<ProductDetails> products = <ProductDetails>[].obs;
  RxList<ProductDetails> favoriteProducts = <ProductDetails>[].obs;
  Rx<ProductDetails?> productDetails = ProductDetails().obs;
  RxBool loading = false.obs;


  static ProductGetxController get to => Get.find();

  Future<void> getProduct({required int id}) async {
    loading.value = true;
    products.value = await productApiController.getProduct(id: id);
    loading.value = false;
    update();
  }

  Future<void> getFavoriteProducts() async {
    loading.value = true;
    favoriteProducts.value = await productApiController.getAllProducts();
    loading.value =false;
    update();
  }

  void onInit() {
    super.onInit();
    getFavoriteProducts();
  }
  Future<void> getProductDetails({required int id}) async {
    loading.value = true;
    productDetails.value = await productApiController.getProductDetails(id: id);
    loading.value = false;
    productDetails.refresh();
    products.refresh();
    favoriteProducts.refresh();
    update();
  }



  // Future<void> rattingProduct({required ProductDetails product,required BuildContext context,required double rate}) async {
  //   bool status = await productApiController.productRate(context, id: product.id,ratting: rate);
  //   if(status){
  //     int index = products.indexWhere((element) => element.id == product.id);
  //     products[index].productRate = rate ;
  //   }
  //   productDetails.refresh();
  //   products.refresh();
  //   favoriteProducts.refresh();
  //   update();
  // }
}