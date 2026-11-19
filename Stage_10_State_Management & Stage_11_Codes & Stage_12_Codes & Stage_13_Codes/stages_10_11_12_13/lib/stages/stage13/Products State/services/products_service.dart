import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stage10/stages/stage13/Products%20State/models/product_model.dart';

class ProductsService {
  Future<List<ProductModel>> getProducts() async {
    final response = await http.get(
      Uri.parse("https://dummyjson.com/products"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List productsJson = data['products'];

      return productsJson
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
