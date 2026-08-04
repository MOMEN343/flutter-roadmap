import 'package:flutter/material.dart';

class ImageTextButtonScreen extends StatefulWidget {
  const ImageTextButtonScreen({super.key});

  @override
  State<ImageTextButtonScreen> createState() => _ImageTextButtonScreen();
}

class _ImageTextButtonScreen extends State<ImageTextButtonScreen> {
  int currentColor = 0;
  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
        title: Text("Image, Text & Button Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage("Images/profile_pic.jpg"),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: colors[currentColor],
                    blurRadius: 20,
                    offset: Offset(-5, -5),
                  ),
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 20,
                    offset: Offset(10, 10),
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 20),
              width: 200,
              height: 200,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "Momen Mohammed Kraizem",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    "Computer Engineer",
                    style: TextStyle(
                      letterSpacing: 3,
                      color: const Color.fromARGB(161, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),

            MaterialButton(
              onPressed: () {
                setState(() {
                  currentColor++;

                  if (currentColor == colors.length) {
                    currentColor = 0;
                  }
                });
              },
              color: Colors.blue,
              textColor: Colors.white,
              hoverColor: Colors.black,
              splashColor: Colors.black,
              minWidth: 150,
              height: 40,
              elevation: 7,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Change Color",
                style: TextStyle(fontWeight: FontWeight(600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
