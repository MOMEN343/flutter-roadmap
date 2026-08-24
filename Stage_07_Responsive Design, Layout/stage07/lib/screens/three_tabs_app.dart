import 'package:flutter/material.dart';
import 'package:stage07/screens/product_screen.dart';
import 'package:stage07/screens/products_screen.dart';

class threeTabsApp extends StatelessWidget {
  @override
  Widget build(Object context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: TabBar(
          labelColor: Color(0xFFb6593a),
          indicatorColor: Color(0xFFb6593a),
          tabs: [
            Tab(
              height: 70,
              child: Text(
                "Pepperoni Pizza",
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
            ),
            Tab(
              height: 70,
              child: Text(
                "Margherita Pizza",
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
            ),
            Tab(
              height: 70,
              child: Text(
                "Special Pizza",
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            ProductScreen(
              imageName: "Pepperoni_Pizza.png",
              pizzaName: "Pepperoni Pizza",
            ),
            ProductScreen(
              imageName: "Margherita_pizza.png",
              pizzaName: "Margherita pizza",
            ),
            ProductScreen(imageName: "pizza.png", pizzaName: "Pizza"),
          ],
        ),
      ),
    );
  }
}
