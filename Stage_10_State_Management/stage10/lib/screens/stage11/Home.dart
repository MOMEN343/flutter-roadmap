import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String username;
  final VoidCallback onThemeChanged;
  final bool isDark;
  const Home({
    super.key,
    required this.username,
    required this.onThemeChanged,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          Switch(
            value: isDark,
            onChanged: (value) {
              onThemeChanged();
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Welcome $username",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
    );
  }
}
