import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stage10/stages/stage13/Products%20State/models/product_model.dart';
import 'package:stage10/stages/stage13/favorites_state/notifiers/favorites_notifier.dart';

final favoritesProvider =
    NotifierProvider<FavoritesNotifier, List<ProductModel>>(
  FavoritesNotifier.new,
);
