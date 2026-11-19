import 'dart:convert';

class ProductsModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final List<String> images;

  ProductsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      price: json["price"],
      images: List<String>.from(json["images"]),
    );
  }
}
