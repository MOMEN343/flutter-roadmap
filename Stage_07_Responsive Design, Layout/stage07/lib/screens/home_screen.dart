import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stage07/screens/product_screen.dart';
import 'package:stage07/screens/products_screen.dart';
import 'package:stage07/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  String selectedValue = "New York, USA";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Location", style: TextStyle(color: Color(0xFF868686))),
                Transform.translate(
                  offset: Offset(0, -10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Color(0xFFb55638),
                            size: 18,
                          ),

                          DropdownButton<String>(
                            underline: SizedBox(),
                            icon: FaIcon(
                              FontAwesomeIcons.chevronDown,
                              size: 14,
                              color: Colors.black,
                            ),
                            value: selectedValue,
                            items: [
                              DropdownMenuItem(
                                value: "New York, USA",
                                child: Text(
                                  "New York, USA  ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                          ),
                        ],
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications),
                      ),
                    ],
                  ),
                ),

                SearchBar(
                  hintText: "Search your favoruit pizza",
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

                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: Color(0xFFf5f5f5),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth < 250) {
                        return Column(
                          children: [
                            PizzaImage(
                              imageWidth: 150,
                              imageHeight: 150,
                              image: "pizza.png",
                            ),
                            OfferDetails(),
                          ],
                        );
                      } else {
                        return Row(
                          children: [
                            Expanded(child: OfferDetails()),

                            PizzaImage(
                              imageHeight: 150,
                              imageWidth: 150,
                              image: "pizza.png",
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),

                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular Pizza",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductsScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "See All",
                            style: TextStyle(color: Color(0xFFc46050)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: MaterialButton(
                            minWidth: 100,
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
                            child: Text("All Pizzas"),
                          ),
                        ),

                        Expanded(
                          child: MaterialButton(
                            minWidth: 110,
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
                              "Vegetarian",
                              style: TextStyle(color: Color(0xFF464646)),
                            ),
                          ),
                        ),

                        Expanded(
                          child: MaterialButton(
                            minWidth: 110,
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
                              "Specials",
                              style: TextStyle(color: Color(0xFF464646)),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      spacing: 10,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductScreen(
                                  imageName: "Pepperoni_Pizza.png",
                                  pizzaName: "Pepperoni Pizza",
                                ),
                              ),
                            );
                          },
                          child: PizzaCard(
                            image: 'Pepperoni_Pizza.png',
                            pizzaName: 'Pepperoni Pizza',
                            subTitle: 'Offer valid today only',
                            min: 20,
                            rate: 4.5,
                            price: 10.00,
                            offPercent: 25,
                          ),
                        ),

                        PizzaCard(
                          image: 'Margherita_pizza.png',
                          pizzaName: 'Margherita pizza',
                          subTitle: 'Discount on all sizes',
                          min: 30,
                          rate: 4.6,
                          price: 8.00,
                          offPercent: 20,
                        ),
                      ],
                    ),

                    // PizzaCard(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OfferDetails extends StatelessWidget {
  const OfferDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),

            child: Text(
              "Special Offer",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),

          Text("Dicount 20% off applied at checkout"),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),

            child: MaterialButton(
              minWidth: 110,
              height: 30,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(30),
              ),
              padding: EdgeInsets.zero,
              color: Color(0xFFdd714d),
              hoverColor: Color(0xFFb55636),
              textColor: Colors.white,
              child: Text("Order Now"),
            ),
          ),
        ],
      ),
    );
  }
}

class PizzaImage extends StatelessWidget {
  final double imageWidth;
  final double imageHeight;
  final String image;
  const PizzaImage({
    super.key,
    required this.imageWidth,
    required this.imageHeight,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageHeight,
      width: imageWidth,

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("Images/$image"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class PizzaCard extends StatefulWidget {
  final String image;
  final String pizzaName;
  final String subTitle;
  final int min;
  final double rate;
  final double price;
  final int offPercent;

  const PizzaCard({
    super.key,
    required this.image,
    required this.pizzaName,
    required this.subTitle,
    required this.min,
    required this.rate,
    required this.price,
    required this.offPercent,
  });

  @override
  State<PizzaCard> createState() => _PizzaCardState();
}

class _PizzaCardState extends State<PizzaCard> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        color: Color(0xFFf5f5f5),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: PizzaImage(
              imageWidth: 140,
              imageHeight: 140,
              image: "${widget.image}",
            ),
          ),

          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(vertical: 3),
                  child: Text(
                    "${widget.pizzaName}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                Text(
                  "${widget.subTitle}",
                  style: TextStyle(color: Color(0xFF888888), fontSize: 14),
                ),
                Row(
                  spacing: 7,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.min}min",
                      style: TextStyle(color: Color(0xFF888888), fontSize: 14),
                    ),
                    Text(
                      ".",

                      style: TextStyle(color: Color(0xFF888888), fontSize: 20),
                    ),
                    Text(
                      "${widget.rate}",
                      style: TextStyle(color: Color(0xFF888888), fontSize: 14),
                    ),
                    Icon(Icons.star, color: Colors.amber, size: 20),
                  ],
                ),
                Row(
                  spacing: 5,
                  children: [
                    Text(
                      "\$${(widget.price).toStringAsFixed(2)}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0,
                        // vertical: 2,
                      ),
                      height: 13,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFbe543a),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "${widget.offPercent}% off",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            flex: 1,
            child: Column(
              // spacing: 40,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      favorite = !favorite;
                    });
                  },
                  icon: Icon(
                    favorite ? Icons.favorite : Icons.favorite_border_outlined,
                  ),
                  color: favorite ? Colors.red : Colors.black,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.add_circle)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
