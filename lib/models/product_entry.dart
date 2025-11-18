// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(
  json.decode(str).map((x) => ProductEntry.fromJson(x)),
);

String productEntryToJson(List<ProductEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String id;
  String name;
  String description;
  String category;
  int price;
  String thumbnail;
  int productViews;
  DateTime createdAt;
  bool isFeatured;
  int userId;

  ProductEntry({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.thumbnail,
    required this.productViews,
    required this.createdAt,
    required this.isFeatured,
    required this.userId,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    category: json["category"],
    price: json["price"],
    thumbnail: json["thumbnail"],
    productViews: json["product_views"] ?? 0,
    createdAt: DateTime.parse(json["created_at"]),
    isFeatured: json["is_featured"] ?? false,
    userId: json["user_id"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "category": category,
    "price": price,
    "thumbnail": thumbnail,
    "product_views": productViews,
    "created_at": createdAt.toIso8601String(),
    "is_featured": isFeatured,
    "user_id": userId,
  };
}
