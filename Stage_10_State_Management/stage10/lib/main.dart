import 'package:flutter/material.dart';
import 'package:stage10/managers/manager_font_family.dart';
import 'package:stage10/screens/counter_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: ManagerFontFamily.mainFont),
      home: CounterApp(),
    );
  }
}
