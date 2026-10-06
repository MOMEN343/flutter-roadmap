import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:stage10/screens/stage12/models/product_details_model.dart';

class ProductDetails extends StatefulWidget {
  final int id;
  const ProductDetails({super.key, required this.id});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool loading = false;
  ProductDetailsModel? productDetails;

  @override
  void initState() {
    super.initState();

    getData();
  }

  Future<void> getData() async {
    setState(() {
      loading = true;
    });
    var response = await get(
      Uri.parse("https://dummyjson.com/products/${widget.id}"),
    );

    var responseBody = jsonDecode(response.body);

    productDetails = ProductDetailsModel.fromJson(responseBody);

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(child: CircularProgressIndicator());
    }

    if (productDetails == null) {
      return Center(child: Text("No data"));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details", style: TextStyle(fontSize: 20)),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            child: Image.network(productDetails!.images[0]),
          ),

          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productDetails!.title,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),

                      Text(
                        productDetails!.description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w100,
                        ),
                      ),

                      SizedBox(height: 10),

                      Row(
                        spacing: 20,
                        children: [
                          Row(
                            spacing: 5,
                            children: [
                              Text(
                                "Price:",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "${productDetails!.price}",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            spacing: 5,
                            children: [
                              Text(
                                "Discount:",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "${productDetails!.discountPercentage}%",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 30,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  color: Colors.blue,
                  child: Text(
                    "Reviews:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.blue.withValues(alpha: 0.2),
                    child: ListView.builder(
                      itemCount: productDetails!.reviews.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              color: Colors.blue.withValues(alpha: 0.3),
                              width: double.infinity,
                              child: Row(
                                spacing: 5,
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "${productDetails!.reviews[index]["reviewerName"]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Icon(Icons.star, color: Colors.yellow),
                                      Text(
                                        "Rating: ${productDetails!.reviews[index]["rating"]}",
                                      ),
                                    ],
                                  ),

                                  Row(
                                    spacing: 5,
                                    children: [
                                      Icon(Icons.comment, color: Colors.blue),
                                      Text(
                                        "Comment: ${productDetails!.reviews[index]["comment"]}",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 15),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
