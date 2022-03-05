import 'package:flutter/material.dart';
import 'package:todo_app/widgets/user_input.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EBFF),
      appBar: AppBar(
        title: const Text("Todoアプリ"),
      ),
      body: Column(
        children: [
          UserInput(),
        ],
      ),
    );
  }
}
