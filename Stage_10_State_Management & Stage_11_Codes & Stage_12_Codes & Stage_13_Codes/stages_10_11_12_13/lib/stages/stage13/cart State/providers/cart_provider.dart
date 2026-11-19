import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stage10/stages/stage13/cart%20State/models/cart_item_model.dart';
import 'package:stage10/stages/stage13/cart%20State/notifiers/cart_notifier.dart';

final cartProvider = NotifierProvider<CartNotifier, List<CartItemModel>>(
  CartNotifier.new,
);
