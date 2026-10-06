import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExercisesStage11 extends StatelessWidget {
  const ExercisesStage11({super.key});

  Future<void> openWebsite() async {
    final Uri url = Uri.parse('https://www.google.com');

    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: openWebsite,
          child: const Text('فتح الموقع'),
        ),
      ),
    );
  }
}
