import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stage10/stages/stage13/Products%20State/models/product_model.dart';
import 'package:stage10/stages/stage13/cart%20State/models/cart_item_model.dart';
import 'package:stage10/stages/stage13/cart%20State/screens/cart_screen.dart';

class CartNotifier extends Notifier<List<CartItemModel>> {
  @override
  List<CartItemModel> build() {
    return [];
  }

  void addProuct(ProductModel product) {
    final index = state.indexWhere((item) => item.product.id == product.id);

    if (index != -1) {
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index)
            state[i].copyWith(quantity: state[i].quantity + 1)
          else
            state[i],
      ];
    } else {
      state = [...state, CartItemModel(product: product, quantity: 1)];
    }
  }

  void incrememtQuantity(int productId) {
    state = [
      for (final item in state)
        if (item.product.id == productId)
          item.copyWith(quantity: item.quantity + 1)
        else
          item,
    ];
  }

  void decementQuantitiy(int productId) {
    final index = state.indexWhere((item) => item.product.id == productId);
    if (index == -1) return;

    if (state[index].quantity == 1) {
      removeProduct(productId);
      return;
    }

    state = [
      for (final item in state)
        if (item.product.id == productId)
          item.copyWith(quantity: item.quantity - 1)
        else
          item,
    ];
  }

  void removeProduct(int productId) {
    state = state.where((item) => item.product.id != productId).toList();
  }

  void clearCart() {
    state = [];
  }

  double get totalPrice {
    return state.fold(
      0,
      (total, item) => total + item.product.price * item.quantity,
    );
  }

  int get totalItems {
    return state.fold(0, (total, item) => total + item.quantity);
  }
}
