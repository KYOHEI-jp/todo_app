import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  var textController = TextEditingController();

  UserInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      color: const Color(0xFFDAB5FF),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                    hintText: "add new todo", border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: const Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
