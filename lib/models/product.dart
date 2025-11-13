class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final String thumbnail;
  final String category;
  final bool isFeatured;
  final int user;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.thumbnail,
    required this.category,
    required this.isFeatured,
    required this.user,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      description: json['description'],
      thumbnail: json['thumbnail'],
      category: json['category'],
      isFeatured: json['is_featured'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'thumbnail': thumbnail,
      'category': category,
      'is_featured': isFeatured,
      'user': user,
    };
  }
}
