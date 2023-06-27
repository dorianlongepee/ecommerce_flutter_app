import 'dart:convert';
import 'package:flutter_shop/models/product.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  static Future<List<Product>> getProducts() async {
    var uri = Uri.https('dummyjson.com', '/products');
    final response = await http.get(uri);

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['products']){
      temp.add(i);
    }

    return Product.productsFromSnapshot(temp);
  }
}