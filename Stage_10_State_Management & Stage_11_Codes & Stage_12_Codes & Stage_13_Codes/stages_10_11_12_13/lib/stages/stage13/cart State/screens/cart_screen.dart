import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stage10/stages/stage13/Products%20State/providers/products_provider.dart';
import 'package:stage10/stages/stage13/cart%20State/providers/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsProvider);
    final cartItem = ref.watch(cartProvider);

    final totalPrice = ref.read(cartProvider.notifier).totalPrice;
    final totalItems = ref.read(cartProvider.notifier).totalItems;

    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping cart"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(cartProvider.notifier).clearCart();
            },
            icon: Icon(Icons.delete_sweep),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: productsState.when(
              data: (products) {
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ListTile(
                      leading: Image.network(
                        product.thumbnail,
                        width: 55,
                        height: 55,
                        fit: BoxFit.cover,
                      ),
                      title: Text(product.title),
                      subtitle: Text("\$${product.price}"),
                      trailing: ElevatedButton(
                        onPressed: () {
                          ref.read(cartProvider.notifier).addProuct(product);
                        },
                        child: Text("Add"),
                      ),
                    );
                  },
                );
              },
              error: (error, stackTrace) => Center(
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(productsProvider.notifier).refresh();
                  },
                  child: Text("Retry"),
                ),
              ),
              loading: () => Center(child: CircularProgressIndicator()),
            ),
          ),

          Divider(),

          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Cart",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("Total items: $totalItems"),
                SizedBox(
                  height: 150,
                  child: cartItem.isEmpty
                      ? Center(child: Text("Your cart is Empty"))
                      : ListView.builder(
                          itemCount: cartItem.length,
                          itemBuilder: (context, index) {
                            final item = cartItem[index];

                            return ListTile(
                              title: Text(item.product.title),
                              subtitle: Text("Quantity: ${item.quantity}"),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      ref
                                          .read(cartProvider.notifier)
                                          .decementQuantitiy(item.product.id);
                                    },
                                    icon: Icon(Icons.remove),
                                  ),

                                  IconButton(
                                    onPressed: () {
                                      ref
                                          .read(cartProvider.notifier)
                                          .removeProduct(item.product.id);
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      ref
                                          .read(cartProvider.notifier)
                                          .incrememtQuantity(item.product.id);
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),

                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "\$${totalPrice.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
