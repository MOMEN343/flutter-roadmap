import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2F2696),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
        title: Text("My Profile"),
        leading: Icon(Icons.arrow_back, color: Colors.white),
      ),

      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Color(0xFF2F2696),
              ),

              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: AssetImage("Images/profile_pic.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      "Momen Kraizem",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "Computer Engineer",
                      style: TextStyle(
                        color: Color.fromARGB(255, 218, 218, 225),
                        fontSize: 10,
                        letterSpacing: 2,
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.only(right: 7),
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFA8A7D1),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Icon(
                              Icons.email_outlined,
                              color: Color(0xFFA8A7D1),
                              size: 20,
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.only(right: 15),
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFA8A7D1),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Icon(
                              Icons.call_outlined,
                              color: Color(0xFFA8A7D1),
                              size: 20,
                            ),
                          ),
                          Text(
                            "|",
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFFA8A7D1),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.only(right: 7, left: 15),
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFA8A7D1),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Icon(
                              Icons.chat_bubble_outline,
                              color: Color(0xFFA8A7D1),
                              size: 20,
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.only(right: 7),
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFA8A7D1),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Icon(
                              Icons.star_border,
                              color: Color(0xFFA8A7D1),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          spacing: 20,
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: Color(0xFF2F2696),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "official",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 145, 144, 148),
                                    fontSize: 12,
                                  ),
                                ),
                                Text("Kraizemmomen@gmail.com"),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          spacing: 20,
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: Color(0xFF2F2696),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "personal",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 145, 144, 148),
                                    fontSize: 12,
                                  ),
                                ),
                                Text("momenmohammed343@gmail.com"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Divider(height: 30, thickness: 0.7),

                  Container(
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mobile Number",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          spacing: 20,
                          children: [
                            Icon(Icons.call_outlined, color: Color(0xFF2F2696)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text("(+970) 59-934-3160")],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Divider(height: 30, thickness: 0.7),

                  Container(
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Team",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              spacing: 20,
                              children: [
                                Icon(
                                  Icons.groups_outlined,
                                  color: Color(0xFF2F2696),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [Text("Project Operational Team")],
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: (Color(0xFF2F2696)),
                                    ),
                                    color: Color(0xFFF1EFF9),
                                  ),
                                  child: Icon(Icons.arrow_forward, size: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Divider(height: 10, thickness: 0.7),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
