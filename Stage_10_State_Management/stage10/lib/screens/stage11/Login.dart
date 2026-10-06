import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stage10/screens/stage11/Home.dart';

class Login extends StatelessWidget {
  final VoidCallback onThemeChanged;
  final bool isDark;

  TextEditingController controller = TextEditingController();

  Login({super.key, required this.onThemeChanged, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          child: Column(
            children: [
              TextFormField(
                controller: controller,
                decoration: InputDecoration(hintText: "Enter your username"),
              ),
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();

                  await pref.setString("username", controller.text);
                  await pref.setBool("loggedin", true);

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Home(
                          username: pref.getString("username")!,
                          onThemeChanged: onThemeChanged,
                          isDark: isDark,
                        );
                      },
                    ),
                  );
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
