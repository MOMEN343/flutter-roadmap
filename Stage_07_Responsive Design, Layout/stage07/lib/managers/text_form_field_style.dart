import 'dart:ui';

import 'package:flutter/material.dart';

class TextFormFieldStyle {
  static InputDecoration inputDecoration = InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFFC5819), width: 2),
      borderRadius: BorderRadius.circular(30),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 1),
      borderRadius: BorderRadius.circular(30),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2),
      borderRadius: BorderRadius.circular(30),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 225, 222, 219),
        width: 2,
      ),
      borderRadius: BorderRadius.circular(30),
    ),

    hintText: "Enter Your Email",
    hintStyle: TextStyle(
      color: Color.fromARGB(255, 156, 155, 153),
      fontSize: 13,
    ),
  );
}
