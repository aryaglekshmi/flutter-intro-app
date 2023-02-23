import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white60),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9eab8e),
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: const Text("Welcome to app"),
      ),
      body: const Center(
        child: Text(
          "This is your first page",
          style: TextStyle(color: Colors.green),
        ),
      ),
    );
  }
}
