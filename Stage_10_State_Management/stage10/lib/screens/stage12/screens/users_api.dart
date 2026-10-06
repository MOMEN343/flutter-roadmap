import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:stage10/screens/stage12/models/user_model.dart';

class UsersApi extends StatefulWidget {
  const UsersApi({super.key});

  @override
  State<UsersApi> createState() => _UsersApiState();
}

class _UsersApiState extends State<UsersApi> {
  List<UserModel> data = [];
  @override
  void initState() {
    super.initState();

    getUsers();
  }

  Future<void> getUsers() async {
    var response = await get(Uri.parse("https://dummyjson.com/users"));

    var responeBody = jsonDecode(response.body);

    data = (responeBody["users"] as List).map((user) {
      return UserModel.fromJson(user);
    }).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users API"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              tileColor: index % 2 == 0 ? Colors.amber : Colors.blue,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              leading: SizedBox(child: Image.network(data[index].image)),
              title: Row(
                spacing: 5,
                children: [
                  Text(data[index].firstName),
                  Text(data[index].lastName),
                ],
              ),
              subtitle: Text(data[index].email, style: TextStyle(fontSize: 10)),
            ),
          );
        },
      ),
    );
  }
}
