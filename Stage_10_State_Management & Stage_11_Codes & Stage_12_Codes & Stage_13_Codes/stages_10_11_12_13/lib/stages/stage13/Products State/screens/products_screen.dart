import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stage10/stages/stage13/Products%20State/providers/products_provider.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProductsState = ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(productsProvider.notifier).refresh();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: ProductsState.when(
        data: (products) => RefreshIndicator(
          onRefresh: () {
            return ref.read(productsProvider.notifier).refresh();
          },
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                leading: Image.network(
                  product.thumbnail,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.image_not_supported);
                  },
                ),
                title: Text(product.title),
                subtitle: Text(
                  product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text('\$${product.price.toStringAsFixed(2)}'),
              );
            },
          ),
        ),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Faild to load products'),
              ElevatedButton(
                onPressed: () {
                  ref.read(productsProvider.notifier).refresh();
                },
                child: Text('Retry'),
              ),
            ],
          ),
        ),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
