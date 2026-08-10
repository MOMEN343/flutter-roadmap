import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  bool status = false;
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfdf4f3),
      appBar: AppBar(
        backgroundColor: darkMode ? Colors.black : Colors.white,
        leading: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFFf5f5f5),
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(Icons.location_history_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ),
        titleTextStyle: TextStyle(
          color: darkMode ? Colors.white : Colors.black,
          fontSize: 20,
        ),
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(15),
              ),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage("Images/profile_pic.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text("Momen Kraizem"),
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
              subtitle: Text("Kraizemmomen@gmail.com"),
              subtitleTextStyle: TextStyle(
                fontSize: 11,
                color: Color.fromARGB(255, 130, 130, 130),
              ),
              trailing: Icon(Icons.edit, size: 20, color: Colors.black),
              onTap: () {},
            ),

            Card(
              color: darkMode ? Colors.black : Colors.white,
              elevation: 0,
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: darkMode ? Colors.white : Colors.black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.dark_mode_outlined,
                        color: darkMode ? Colors.black : Colors.white,
                      ),
                    ),

                    title: Text("Dark Mode"),
                    textColor: darkMode ? Colors.white : Colors.black,
                    trailing: Transform.scale(
                      scale: 0.7,
                      child: Switch(
                        value: status,
                        onChanged: (val) {
                          setState(() {
                            status = val;
                            darkMode = val;
                          });
                        },
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),

            Card(
              color: darkMode ? Colors.black : Colors.white,
              elevation: 0,
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    leading: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFFff6665),
                      ),
                      child: Icon(
                        Icons.fastfood_outlined,
                        color: darkMode ? Colors.black : Colors.white,
                      ),
                    ),

                    title: Text(
                      "About Foody",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textColor: darkMode ? Colors.white : Colors.black,
                    subtitle: Text(
                      "Active Bids, In Progress, Orders",
                      style: TextStyle(color: Color(0xFFb6b6b6), fontSize: 12),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                      color: darkMode ? Colors.white : Colors.black,
                    ),

                    onTap: () {},
                  ),

                  ListTile(
                    dense: true,
                    leading: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFFffbc32),
                      ),
                      child: Icon(
                        Icons.translate_outlined,
                        color: darkMode ? Colors.black : Colors.white,
                      ),
                    ),

                    title: Text(
                      "Language & Settings",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textColor: darkMode ? Colors.white : Colors.black,
                    subtitle: Text(
                      "Active Asks, Sales, Selier Profile",
                      style: TextStyle(color: Color(0xFFb6b6b6), fontSize: 12),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                      color: darkMode ? Colors.white : Colors.black,
                    ),

                    onTap: () {},
                  ),

                  ListTile(
                    dense: true,
                    leading: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFFf64b22),
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        color: darkMode ? Colors.black : Colors.white,
                      ),
                    ),

                    title: Text(
                      "Favorites",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textColor: darkMode ? Colors.white : Colors.black,
                    subtitle: Text(
                      "Items and Lists You,ve Saved",
                      style: TextStyle(color: Color(0xFFb6b6b6), fontSize: 12),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                      color: darkMode ? Colors.white : Colors.black,
                    ),

                    onTap: () {},
                  ),

                  ListTile(
                    dense: true,
                    leading: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFF5ed85d),
                      ),
                      child: Icon(
                        Icons.settings_outlined,
                        color: darkMode ? Colors.black : Colors.white,
                      ),
                    ),

                    title: Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textColor: darkMode ? Colors.white : Colors.black,
                    subtitle: Text(
                      "Security And Notifications",
                      style: TextStyle(color: Color(0xFFb6b6b6), fontSize: 12),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                      color: darkMode ? Colors.white : Colors.black,
                    ),

                    onTap: () {},
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            Card(
              color: darkMode ? Colors.black : Colors.white,
              elevation: 0,
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    leading: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFF00cedb),
                      ),
                      child: Icon(
                        Icons.feedback_outlined,
                        color: darkMode ? Colors.black : Colors.white,
                      ),
                    ),

                    title: Text(
                      "FAQ",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textColor: darkMode ? Colors.white : Colors.black,
                    subtitle: Text(
                      "Payments, Payout, Gift Cards, Credits",
                      style: TextStyle(color: Color(0xFFb6b6b6), fontSize: 12),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                      color: darkMode ? Colors.white : Colors.black,
                    ),

                    onTap: () {},
                  ),

                  ListTile(
                    dense: true,
                    leading: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFFffbc32),
                      ),
                      child: Icon(
                        Icons.edit_note_outlined,
                        color: darkMode ? Colors.black : Colors.white,
                      ),
                    ),

                    title: Text(
                      "Terms of use",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textColor: darkMode ? Colors.white : Colors.black,
                    subtitle: Text(
                      "Secutrity And Notification",
                      style: TextStyle(color: Color(0xFFb6b6b6), fontSize: 12),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                      color: darkMode ? Colors.white : Colors.black,
                    ),

                    onTap: () {},
                  ),

                  ListTile(
                    dense: true,
                    leading: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFFf64b22),
                      ),
                      child: Icon(
                        Icons.privacy_tip_outlined,
                        color: darkMode ? Colors.black : Colors.white,
                      ),
                    ),

                    title: Text(
                      "Privacy Policy",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textColor: darkMode ? Colors.white : Colors.black,
                    subtitle: Text(
                      "Security And Notification",
                      style: TextStyle(color: Color(0xFFb6b6b6), fontSize: 12),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                      color: darkMode ? Colors.white : Colors.black,
                    ),

                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
