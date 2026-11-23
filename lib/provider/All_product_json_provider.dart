import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/model_of_product.dart';

class AllProductJsonProvider extends ChangeNotifier {
   List<ModelOfProduct> products = [];


  Future<void> readJson() async {
    final response = await rootBundle.loadString(
      'assets/json/products.json',
    );

    final List data = jsonDecode(response);

    products = data.map((item) {
      return ModelOfProduct(
        productName: item['productName'],
        image: item['image'],
        price: item['price'].toString(),
        rating: item['rating'].toString(),
        category: item['category'],
        description: item['description'],
      );
    }).toList();

    notifyListeners();

  }

}