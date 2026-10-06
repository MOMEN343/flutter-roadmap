import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SimplePagination extends StatefulWidget {
  const SimplePagination({super.key});

  @override
  State<SimplePagination> createState() => _SimplePagination();
}

class _SimplePagination extends State<SimplePagination> {
  List users = [];
  int skip = 0;

  Future<void> getUsers() async {
    var response = await get(
      Uri.parse('https://dummyjson.com/users?limit=10&skip=$skip'),
    );

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);

      setState(() {
        users.addAll(responseBody["users"]);
        skip += 10;
      });
    } else {
      print("Get Users Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index]["firstName"]),
                  subtitle: Text(users[index]["email"]),
                );
              },
            ),
          ),

          MaterialButton(
            color: Colors.red,
            onPressed: getUsers,
            child: Text("Show More", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
