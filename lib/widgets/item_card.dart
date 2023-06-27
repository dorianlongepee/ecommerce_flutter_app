import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            height: 200,
            child: Placeholder()
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Catégorie du produit'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  "Nom du produit sur plusieurs lignes",
                  style: Theme.of(context).textTheme.headlineSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "Description succinte du produit, potentiellement sur plusieurs lignes",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Text("50.00€"),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.add_shopping_cart_rounded),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}