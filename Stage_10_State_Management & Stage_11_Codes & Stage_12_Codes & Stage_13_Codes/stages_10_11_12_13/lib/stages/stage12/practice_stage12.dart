import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PracticeStage12 extends StatefulWidget {
  const PracticeStage12({super.key});

  @override
  State<PracticeStage12> createState() => _PracticeStage12State();
}

class _PracticeStage12State extends State<PracticeStage12> {
  bool loading = false;
  List data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            color: Colors.amber,
            onPressed: () async {
              loading = true;
              setState(() {});

              var response = await get(
                Uri.parse("https://jsonplaceholder.typicode.com/photos"),
              );

              var responseBody = jsonDecode(response.body);

              data.addAll(responseBody.take(15));

              loading = false;
              setState(() {});
            },
            child: const Text("Http Request"),
          ),
          if (loading) CircularProgressIndicator(),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(data[index]['title']),
                    subtitle: Image.network(data[index]['url']),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
