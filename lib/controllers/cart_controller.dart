import 'package:flutter_shop/models/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var _products = {}.obs;

  /*
  * Add a product to the cart
   */
  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  /*
  * Get carts products
   */
  get products => _products;

  get productsCount => _products.length;

  get productsSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
