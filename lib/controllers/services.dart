import 'dart:convert';

import 'package:ecommerce_clothing_app/Hive/product_cart_hive.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Services extends ChangeNotifier {
  static const String baseUrl = 'https://fakestoreapi.com/products';
  // static const String baseUrl = 'https://kohls.p.rapidapi.com/products/list';

//---Fetching data from fakestoreapi

  static Future<List<ProductModel>> getProducts() async {
    List<ProductModel> products = [];

    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      products.addAll(data.map((e) => ProductModel.fromMap(e)).toList());
      return products;
    } else {
      throw Exception("failed to load products");
    }
  }
}
