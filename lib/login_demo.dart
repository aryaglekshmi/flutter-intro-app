import 'package:flutter/material.dart';

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: const Color(0x99ad2c2c)),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _username = TextEditingController();

  final TextEditingController _password = TextEditingController();

  String _usernamepassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffdcaa12),
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text("Welcome to GCafe"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            color: Colors.black26,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: _username,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter Your Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: _password,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Password',
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _usernamepassword = "User name is " +
                          _username.text +
                          "and Password is " +
                          _password.text;
                      _password.text = "";
                      _username.text = "";
                    });
                  },
                  child: const Text("Print")),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(_usernamepassword),
              )
            ]),
          ),
        ));
  }
}
