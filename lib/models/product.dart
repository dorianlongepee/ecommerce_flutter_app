class Product {
  final String image, name, description, category;
  final int price;
  final num rating;

  Product({
    required this.image,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
  });

factory Product.fromJson(dynamic json) {
    return Product(
      image: json['images'][0],
      name: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      price: json['price'] as int,
      rating: json['rating'] as num,
    );
  }

  static List<Product> productsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Product.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Product(image: $image, name: $name, description: $description, category: $category, price: $price, rating: $rating)';
  }
}
