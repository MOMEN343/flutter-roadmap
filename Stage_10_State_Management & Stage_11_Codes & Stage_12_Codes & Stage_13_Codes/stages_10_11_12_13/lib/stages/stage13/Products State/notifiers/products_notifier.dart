import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stage10/stages/stage13/Products%20State/models/product_model.dart';
import 'package:stage10/stages/stage13/Products%20State/services/products_service.dart';

class ProductsNotifier extends AsyncNotifier<List<ProductModel>> {
  final ProductsService _service = ProductsService();
  @override
  Future<List<ProductModel>> build() {
    return _service.getProducts();
  }

  Future<void> refresh() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() => _service.getProducts());
  }
}
