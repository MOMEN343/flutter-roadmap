import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});
  List pizza = [
    {
      "name": "Melting Cheese",
      "image": "melting_cheese.png",
      "price": 8.99,
      "time": 20,
      "percent": 4.8,
    },

    {
      "name": "Spinach & Chicken",
      "image": "spinach&chicken.png",
      "price": 10.99,
      "time": 25,
      "percent": 4.7,
    },

    {
      "name": "Cherry Tomato",
      "image": "cerry_tomato.png",
      "price": 12.99,
      "time": 24,
      "percent": 4.8,
    },

    {
      "name": "Ultimate Cheese Bliss",
      "image": "ultimate_cheese_bliss.png",
      "price": 14.99,
      "time": 30,
      "percent": 4.8,
    },
    {
      "name": "Melting Cheese",
      "image": "melting_cheese.png",
      "price": 8.99,
      "time": 20,
      "percent": 4.8,
    },

    {
      "name": "Spinach & Chicken",
      "image": "spinach&chicken.png",
      "price": 10.99,
      "time": 25,
      "percent": 4.7,
    },

    {
      "name": "Cherry Tomato",
      "image": "cerry_tomato.png",
      "price": 12.99,
      "time": 24,
      "percent": 4.8,
    },

    {
      "name": "Ultimate Cheese Bliss",
      "image": "ultimate_cheese_bliss.png",
      "price": 14.99,
      "time": 30,
      "percent": 4.8,
    },
  ];

  @override
  Widget build(Object context) {
    return Scaffold(
      backgroundColor: Color(0xFFf1f6f7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              spacing: 10,
              children: [
                SearchBar(
                  hintText: "Search your pizza here",
                  hintStyle: WidgetStatePropertyAll(
                    TextStyle(color: Color(0xFF878787), fontSize: 13),
                  ),
                  leading: Icon(
                    Icons.search,
                    color: Color(0xFF878787),
                    size: 20,
                  ),
                  trailing: [Icon(Icons.tune_rounded)],
                  elevation: WidgetStatePropertyAll(0),
                  backgroundColor: WidgetStatePropertyAll(Color(0xFFf5f5f5)),

                  constraints: BoxConstraints(minHeight: 35, maxHeight: 35),

                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        minWidth: 50,
                        height: 35,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(30),
                        ),
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        color: Color(0xFFb55638),
                        hoverColor: Color(0xFFdd714d),
                        focusColor: Color(0xFFb55638),
                        textColor: Colors.white,
                        child: Text("All"),
                      ),

                      MaterialButton(
                        minWidth: 80,
                        height: 35,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(30),
                        ),
                        padding: EdgeInsets.zero,
                        color: Color(0xFFf5f5f5),
                        focusColor: Color(0xFFb55638),
                        hoverColor: Color(0xFFdd714d),
                        elevation: 0,
                        textColor: Colors.white,
                        child: Text(
                          "Italian",
                          style: TextStyle(color: Color(0xFF464646)),
                        ),
                      ),
                      MaterialButton(
                        minWidth: 80,
                        height: 35,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(30),
                        ),
                        padding: EdgeInsets.zero,
                        color: Color(0xFFf5f5f5),
                        focusColor: Color(0xFFb55638),
                        hoverColor: Color(0xFFdd714d),
                        elevation: 0,
                        textColor: Colors.white,
                        child: Text(
                          "Mexiacan",
                          style: TextStyle(color: Color(0xFF464646)),
                        ),
                      ),
                      MaterialButton(
                        minWidth: 80,
                        height: 35,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(30),
                        ),
                        padding: EdgeInsets.zero,
                        color: Color(0xFFf5f5f5),
                        focusColor: Color(0xFFb55638),
                        hoverColor: Color(0xFFdd714d),
                        elevation: 0,
                        textColor: Colors.white,
                        child: Text(
                          "American",
                          style: TextStyle(color: Color(0xFF464646)),
                        ),
                      ),
                    ],
                  ),
                ),

                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 247,
                    // childAspectRatio: 0.5,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: pizza.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      name: pizza[index]["name"],
                      price: pizza[index]["price"],
                      image: pizza[index]["image"],
                      time: pizza[index]["time"],
                      percent: pizza[index]["percent"],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  String name;
  double price;
  String image;
  int time;
  double percent;

  ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.time,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Column(
        spacing: 10,
        children: [
          Column(
            spacing: 5,
            children: [
              Text(
                "$name",
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "\$${price.toStringAsFixed(2)}",
                style: TextStyle(color: Color(0xFF6d6c74), fontSize: 18),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("Images/$image"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                spacing: 5,
                children: [
                  Icon(Icons.access_time, size: 18, color: Color(0xFF6d6c74)),
                  Text(
                    "${time}min",
                    style: TextStyle(fontSize: 12, color: Color(0xFF6d6c74)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 3,
                    children: [
                      Icon(
                        Icons.star_border_outlined,
                        size: 20,
                        color: Color(0xFFdd714d),
                      ),
                      Text("$percent"),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_box, color: Color((0xFFdd714d))),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
