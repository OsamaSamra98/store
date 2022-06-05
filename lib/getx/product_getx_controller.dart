
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/controllers/product_api_controller.dart';
import '../models/product_details.dart';



class ProductGetxController extends GetxController {
  final ProductApiController productApiController = ProductApiController();
  RxList<ProductDetails> products = <ProductDetails>[].obs;
  RxList<ProductDetails> productsSelected = <ProductDetails>[].obs;
  Rx<ProductDetails?> productDetails = ProductDetails().obs;
  RxBool loading = false.obs;


  static ProductGetxController get to => Get.find();

  Future<void> getProduct() async {
    loading.value = true;
    products.value = await productApiController.getAllProducts();
    loading.value = false;
    update();
  }
  getProductByType(String? category){
    if(category == null){
      productsSelected.value = products;
    }else{
      productsSelected.value = products.where((p0) => p0.category == category).toList();
    }
  }

  void onInit() {
    super.onInit();
    getProduct();
  }
  Future<void> getProductDetails({required int id}) async {
    loading.value = true;
    productDetails.value = await productApiController.getProductDetails(id: id);
    loading.value = false;
    productDetails.refresh();
    products.refresh();
    update();
  }




}