import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final String imageName;
  final String pizzaName;
  const ProductScreen({
    super.key,
    required this.imageName,
    required this.pizzaName,
  });

  @override
  State<ProductScreen> createState() => _ProductScreen();
}

class _ProductScreen extends State<ProductScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: const Color(0xFFF7F8F7),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      // Image + buttons
                      Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 18,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_border),
                              ),
                            ],
                          ),

                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  final imageSize = constraints.maxWidth * 0.65;

                                  return Image.asset(
                                    "Images/${widget.imageName}",
                                    height: imageSize.clamp(180.0, 250.0),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Counter
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        width: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFFB45637),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (counter > 0) {
                                    counter--;
                                  }
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),

                            Text(
                              counter.toString().padLeft(2, '0'),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            InkWell(
                              onTap: () {
                                setState(() {
                                  counter++;
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ================= DETAILS SECTION =================
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 10,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "${widget.pizzaName}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.star, color: Colors.amberAccent),
                              Text("4.5"),
                            ],
                          ),
                        ],
                      ),

                      // Description
                      const Text(
                        "Baked to perfection on a crispy golden crust, "
                        "this pizza delivers the perfect balance of bold "
                        "flavors and cheesy goodness ...",
                        style: TextStyle(color: Color(0xFFB5B6B5)),
                      ),

                      // Product information
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Flexible(
                            child: Text(
                              "⏰ 8-16 Min",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "🌶 Medium",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "🔥 250Kcal",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),

                      // ================= TOPPINGS =================
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Toppings",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),

                            LayoutBuilder(
                              builder: (context, constraints) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    topping("🍄"),
                                    topping("🍥"),
                                    topping("🥠"),
                                    topping("☘"),
                                    topping("🧅"),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      // ================= PRICE + BUTTON =================
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Price",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFFB8B8B8),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\$10.00",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "\$10.00",
                                        style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: Color(0xFFB8B8B8),
                                          decorationThickness: 2,
                                          color: Color(0xFFB8B8B8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(width: 10),

                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFB6593A),
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.shopping_bag_rounded),
                                    SizedBox(width: 5),
                                    Text("Add to Bag"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= TOPPING WIDGET =================

  Widget topping(String emoji) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F5F3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(emoji, style: const TextStyle(fontSize: 22)),
      ),
    );
  }
}
