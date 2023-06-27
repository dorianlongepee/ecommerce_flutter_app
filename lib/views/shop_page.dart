import 'package:flutter/material.dart';
import 'package:flutter_shop/constants.dart';
import 'package:flutter_shop/widgets/item_card.dart';

import '../models/Product.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            Wrap(
              spacing: defaultPadding,
              runSpacing: defaultPadding,
              alignment: WrapAlignment.center,
              children: products.map((product) => ItemCard(product: product)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}