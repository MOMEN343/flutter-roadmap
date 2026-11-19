import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stage10/stages/stage13/Products%20State/providers/products_provider.dart';
import 'package:stage10/stages/stage13/favorites_state/providers/favorites_provider.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsProvider);
    final favoriteList = ref.watch(favoritesProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorites State'),
          centerTitle: true,
          actions: [
            if (favoriteList.isNotEmpty)
              IconButton(
                tooltip: 'Clear Favorites',
                icon: const Icon(Icons.delete_sweep),
                onPressed: () {
                  ref.read(favoritesProvider.notifier).clearFavorites();
                },
              ),
          ],
          bottom: TabBar(
            tabs: [
              const Tab(
                icon: Icon(Icons.shopping_bag_outlined),
                text: 'All Products',
              ),
              Tab(
                icon: Badge(
                  isLabelVisible: favoriteList.isNotEmpty,
                  label: Text('${favoriteList.length}'),
                  child: const Icon(Icons.favorite),
                ),
                text: 'Favorites (${favoriteList.length})',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: All Products with Favorite Toggle
            productsState.when(
              data: (products) => RefreshIndicator(
                onRefresh: () async {
                  await ref.read(productsProvider.notifier).refresh();
                },
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    final isFav = favoriteList.any(
                      (item) => item.id == product.id,
                    );

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            product.thumbnail,
                            width: 55,
                            height: 55,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.broken_image),
                          ),
                        ),
                        title: Text(
                          product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: isFav ? Colors.red : null,
                          ),
                          onPressed: () {
                            ref
                                .read(favoritesProvider.notifier)
                                .toggleFavorite(product);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, _) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 48,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 8),
                    Text('Error: $error'),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(productsProvider.notifier).refresh();
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),

            // Tab 2: Favorites List
            favoriteList.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 64,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'No favorites added yet',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: favoriteList.length,
                    itemBuilder: (context, index) {
                      final product = favoriteList[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              product.thumbnail,
                              width: 55,
                              height: 55,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.broken_image),
                            ),
                          ),
                          title: Text(
                            product.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              ref
                                  .read(favoritesProvider.notifier)
                                  .removeFavorite(product.id);
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
