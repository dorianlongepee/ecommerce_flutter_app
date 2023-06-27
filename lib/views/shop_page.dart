import 'package:flutter/material.dart';
import 'package:flutter_shop/constants.dart';
import 'package:flutter_shop/widgets/item_card.dart';

import '../models/product.api.dart';
import '../models/product.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<Product> products = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  Future<void> getProducts() async{
    products = await ProductApi.getProducts();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
              children: [
                Wrap(
                  spacing: defaultPadding,
                  runSpacing: defaultPadding,
                  children: products.map((product) => ItemCard(product: product)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}