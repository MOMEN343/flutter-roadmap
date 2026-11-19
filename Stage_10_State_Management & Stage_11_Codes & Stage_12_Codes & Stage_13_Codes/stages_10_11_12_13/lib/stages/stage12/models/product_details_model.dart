class ProductDetailsModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final double discountPercentage;
  final List<String> images;
  final List<Map<String, dynamic>> reviews;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.category,
    required this.discountPercentage,
    required this.reviews,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      price: json["price"],
      images: List<String>.from(json["images"]),
      category: json["category"],
      discountPercentage: json["discountPercentage"],
      reviews: List<Map<String, dynamic>>.from(json["reviews"]),
    );
  }
}
