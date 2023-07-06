import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/item_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../models/product.api.dart';
import '../models/product.dart';

class ShopPage extends StatefulWidget {
  const ShopPage(changeRoute, {super.key});

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

  Future<void> getProducts() async {
    products = await ProductApi.getProducts();
    setState(() {
      loading = false;
    });
  }

  int getAxisCount(BuildContext context) {
    if (MediaQuery.of(context).size.width < 800) {
      return 1;
    } else if (MediaQuery.of(context).size.width < 900) {
      return 2;
    } else if (MediaQuery.of(context).size.width < 1300) {
      return 3;
    } else {
      return 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: AlignedGridView.count(
                    itemCount: products.length,
                    crossAxisCount: getAxisCount(context),
                    mainAxisSpacing: 4,
                    itemBuilder: (context, index) {
                      return ItemCard(
                        product: products[index],
                      );
                    }),
              ));
  }
}
