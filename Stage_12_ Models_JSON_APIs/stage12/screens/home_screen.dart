import 'package:flutter/material.dart';
import 'package:stage10/screens/stage12/models/login_model.dart';

class HomeScreen extends StatelessWidget {
  final LoginModel data;
  const HomeScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Image.network(data.image),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 3,
                  children: [
                    Text(
                      data.firstName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data.lastName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Text(data.email),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
