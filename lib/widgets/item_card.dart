import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_shop/constants.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final cartController = Get.put(CartController());
  ItemCard({Key? key, required this.product}) : super(key: key);

  double getWidth(context){
    if(MediaQuery.of(context).size.width < 600) {
      return MediaQuery
          .of(context)
          .size
          .width;
    }
    else if(MediaQuery.of(context).size.width < 800) {
      return MediaQuery
          .of(context)
          .size
          .width / 2.5;
    } else {
      return MediaQuery
          .of(context)
          .size
          .width / 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: Card(
        child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                height: 200,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(product.image, fit: BoxFit.cover)
                )
            ),
            Padding(
              padding: EdgeInsets.all(defaultPadding/1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.category),
                  SizedBox(height: defaultPadding/4),
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: defaultPadding/4),
                  Text(
                    product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: defaultPadding/4),
                  RatingBarIndicator(
                    rating: product.rating.toDouble(),
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    itemCount: 5,
                    itemSize:16.0,
                  ),
                  SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Text("${product.price}€"),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.add_shopping_cart_rounded),
                        onPressed: () {
                          cartController.addProduct(product);
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}