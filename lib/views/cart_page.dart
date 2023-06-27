import 'package:flutter/material.dart';
import 'package:flutter_shop/constants.dart';
import 'package:flutter_shop/controllers/cart_controller.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:get/get.dart';


class CartPage extends StatelessWidget {
  final CartController controller = Get.find();
  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
                child: Text(
                    'Mon panier',
                    style: Theme.of(context).textTheme.headlineMedium,
                )
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding),
                child: Row(
                  children: [
                    Row(
                      children: [
                        const Text('Nombre d\'articles'),
                        SizedBox(width: defaultPadding),
                        Obx(
                          () => Text("${controller.productsCount}")
                        ),
                      ],
                    ),
                    SizedBox(width: defaultPadding*2),
                    Row(
                      children: [
                        Text('Prix total'),
                        SizedBox(width: defaultPadding),
                        Obx(
                          () => controller.productsCount == 0
                          ? const Text("Card is empty")
                          : Text("${controller.total} €")
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            Obx(
              () => Expanded(
                child: ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) =>
                        CartItem(
                          controller: controller,
                          product: controller.products.keys.toList()[index],
                          quantity: controller.products.values.toList()[index],
                          index: index,
                        )
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;
  const CartItem({
    super.key, required this.controller, required this.product, required this.quantity, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          SizedBox(
            width: 200,
            height: 150,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    bottomLeft: Radius.circular(14)
                ),
                child: Image.network(
                    product.image,
                    fit: BoxFit.cover
                )
            )
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(product.name),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("${product.price}€"),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                controller.removeProduct(product);
                              },
                            ),
                            Text("$quantity"),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () {
                                controller.addProduct(product);
                              },
                            ),
                          ],
                        ),
                        Text("${controller.productsSubtotal.toString()}"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}