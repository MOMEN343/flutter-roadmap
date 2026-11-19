import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stage10/stages/stage13/Products%20State/models/product_model.dart';
import 'package:stage10/stages/stage13/Products%20State/notifiers/products_notifier.dart';

final productsProvider =
    AsyncNotifierProvider<ProductsNotifier, List<ProductModel>>(
      ProductsNotifier.new,
    );
