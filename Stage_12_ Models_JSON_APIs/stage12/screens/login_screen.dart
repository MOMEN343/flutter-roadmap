import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:stage10/screens/stage12/models/login_model.dart';
import 'package:stage10/screens/stage12/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  Future<void> login() async {
    var response = await post(
      Uri.parse('https://dummyjson.com/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': usernameController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      var loginModel = LoginModel.fromJson(responseBody);

      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => HomeScreen(data: loginModel)),
      );
    } else {
      print('Login Failed');
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(hintText: "username"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(hintText: "password"),
            ),

            MaterialButton(
              color: Colors.red,
              onPressed: login,
              minWidth: double.infinity,
              height: 40,
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
