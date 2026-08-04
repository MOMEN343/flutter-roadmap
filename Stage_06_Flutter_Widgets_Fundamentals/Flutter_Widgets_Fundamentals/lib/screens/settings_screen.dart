import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  bool status = false;
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode
          ? Color.fromARGB(255, 190, 190, 190)
          : Color(0xFFFFE9D9),
      appBar: AppBar(
        backgroundColor: darkMode ? Colors.black : Color(0xFFFFE9D9),
        leading: Container(
          padding: EdgeInsets.all(3),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: darkMode ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.arrow_back,
              color: darkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        titleTextStyle: TextStyle(
          color: darkMode ? Colors.white : Colors.black,
          fontSize: 25,
        ),
        title: Text("Settings"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            ListTile(
              tileColor: darkMode ? Colors.black : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(15),
              ),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage("Images/card_pic.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text("Momen Kraizem"),
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: darkMode ? Colors.white : Colors.black,
              ),
              subtitle: Text("Flutter Developer | Computer Engineer"),
              subtitleTextStyle: TextStyle(
                fontSize: 11,
                color: darkMode
                    ? Colors.white
                    : Color.fromARGB(255, 130, 130, 130),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
                color: darkMode ? Colors.white : Colors.black,
              ),
              onTap: () {},
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Other Settings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            Container(
              child: Card(
                color: darkMode ? Colors.black : Colors.white,
                elevation: 0,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.person_outline_sharp,
                        color: darkMode ? Colors.white : Colors.black,
                      ),
                      title: Text("Profile Details"),
                      textColor: darkMode ? Colors.white : Colors.black,
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                        color: darkMode ? Colors.white : Colors.black,
                      ),

                      onTap: () {},
                    ),
                    Divider(
                      height: 0,
                      color: darkMode
                          ? Colors.white
                          : const Color.fromARGB(255, 192, 192, 192),
                      endIndent: 15,
                      indent: 15,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.admin_panel_settings_outlined,
                        color: darkMode ? Colors.white : Colors.black,
                      ),
                      title: Text("Password"),
                      textColor: darkMode ? Colors.white : Colors.black,
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                        color: darkMode ? Colors.white : Colors.black,
                      ),
                      onTap: () {},
                    ),
                    Divider(
                      height: 0,
                      color: darkMode
                          ? Colors.white
                          : const Color.fromARGB(255, 192, 192, 192),
                      endIndent: 15,
                      indent: 15,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.notifications_none_outlined,
                        color: darkMode ? Colors.white : Colors.black,
                      ),
                      title: Text("Notifications"),
                      textColor: darkMode ? Colors.white : Colors.black,
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                        color: darkMode ? Colors.white : Colors.black,
                      ),
                      onTap: () {},
                    ),
                    Divider(
                      height: 0,
                      color: darkMode
                          ? Colors.white
                          : const Color.fromARGB(255, 192, 192, 192),
                      endIndent: 15,
                      indent: 15,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.dark_mode_outlined,
                        color: darkMode ? Colors.white : Colors.black,
                      ),
                      title: Text("Dark Mode"),
                      textColor: darkMode ? Colors.white : Colors.black,
                      trailing: Switch(
                        value: status,
                        onChanged: (val) {
                          setState(() {
                            status = val;
                            darkMode = val;
                          });
                        },
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Card(
                color: darkMode ? Colors.black : Colors.white,
                elevation: 0,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.support_agent_outlined,
                        color: darkMode ? Colors.white : Colors.black,
                      ),
                      title: Text("Support"),
                      textColor: darkMode ? Colors.white : Colors.black,
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                        color: darkMode ? Colors.white : Colors.black,
                      ),
                      onTap: () {},
                    ),
                    Divider(
                      height: 0,
                      color: darkMode
                          ? Colors.white
                          : const Color.fromARGB(255, 192, 192, 192),
                      endIndent: 15,
                      indent: 15,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.report_gmailerrorred,
                        color: darkMode ? Colors.white : Colors.black,
                      ),
                      title: Text("Report an Issue"),
                      textColor: darkMode ? Colors.white : Colors.black,
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                        color: darkMode ? Colors.white : Colors.black,
                      ),
                      onTap: () {},
                    ),
                    Divider(
                      height: 0,
                      color: darkMode
                          ? Colors.white
                          : const Color.fromARGB(255, 192, 192, 192),
                      endIndent: 15,
                      indent: 15,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.question_mark_rounded,
                        color: darkMode ? Colors.white : Colors.black,
                      ),
                      title: Text("About Chracter.Ai"),
                      textColor: darkMode ? Colors.white : Colors.black,
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                        color: darkMode ? Colors.white : Colors.black,
                      ),
                      onTap: () {},
                    ),
                    Divider(
                      height: 0,
                      color: darkMode
                          ? Colors.white
                          : const Color.fromARGB(255, 192, 192, 192),
                      endIndent: 15,
                      indent: 15,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.language_outlined,
                        color: darkMode ? Colors.white : Colors.black,
                      ),
                      title: Text("Language"),
                      textColor: darkMode ? Colors.white : Colors.black,
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
            ),
          ],
        ),
      ),
    );
  }
}
