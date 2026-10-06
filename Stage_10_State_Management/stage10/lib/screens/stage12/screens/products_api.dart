import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:stage10/screens/stage12/models/products_model.dart';
import 'package:stage10/screens/stage12/screens/product_details.dart';

class ProductsApi extends StatefulWidget {
  const ProductsApi({super.key});

  @override
  State<ProductsApi> createState() => _ProductsApiState();
}

class _ProductsApiState extends State<ProductsApi> {
  bool loading = false;
  List<ProductsModel> products = [];

  @override
  void initState() {
    super.initState();

    getData();
  }

  Future<void> getData() async {
    setState(() {
      loading = true;
    });
    var response = await get(Uri.parse("https://dummyjson.com/products"));

    var responseBody = jsonDecode(response.body);

    products = (responseBody["products"] as List).map((product) {
      return ProductsModel.fromJson(product);
    }).toList();

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        centerTitle: true,
        title: Text("Products API"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (loading) Center(child: CircularProgressIndicator()),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetails(id: products[index].id),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            products[index].images[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                products[index].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text(
                                '\$${products[index].price}',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
