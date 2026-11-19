import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stage10/stages/stage13/Products%20State/models/product_model.dart';

class FavoritesNotifier extends Notifier<List<ProductModel>> {
  @override
  List<ProductModel> build() {
    return [];
  }

  void toggleFavorite(ProductModel product) {
    final isExist = state.any((item) => item.id == product.id);

    if (isExist) {
      state = state.where((item) => item.id != product.id).toList();
    } else {
      state = [...state, product];
    }
  }

  void removeFavorite(int productId) {
    state = state.where((item) => item.id != productId).toList();
  }

  void clearFavorites() {
    state = [];
  }

  bool isFavorite(int productId) {
    return state.any((item) => item.id == productId);
  }

  int get totalFavorites => state.length;
}
