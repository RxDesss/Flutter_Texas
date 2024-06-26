// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:demo_project/Screens/searchProduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchProductController extends GetxController{

  List<dynamic> AllProduct=[].obs;
  List<dynamic> filteredProducts =[].obs;

void filterProducts(String keyword) {
    if (keyword.isEmpty) {
      // If the keyword is empty, show all products
      filteredProducts.assignAll(AllProduct);
    } else {
      // Filter products based on the keyword
     List<dynamic>  filteredList = AllProduct
          .where((product) => product['sku'].toLowerCase().contains(keyword))
          .toList();
      filteredProducts.assignAll(filteredList);
    }
  }

  Future<void> fetchAllProduct()async{
    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
    String Url='https://www.texasknife.com/dynamic/texasknifeapi.php?action=get_product_like';
    var res=await http.get(Uri.parse(Url));
    if(res.statusCode==200){
         final body = res.body;
      final json = jsonDecode(body);
      AllProduct = json['data'];
      Get.back();
      Get.to(()=>const SearchProduct());
    }
  }
}