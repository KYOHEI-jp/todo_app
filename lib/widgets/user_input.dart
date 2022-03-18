import 'package:flutter/material.dart';

import '../model/todo_model.dart';

class UserInput extends StatelessWidget {
  var textController = TextEditingController();
  final Function insertFunction; // addItem functionを受け取る
  UserInput({Key? key, required this.insertFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      color: Color(0xFFFFFFFF),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                    hintText: "TODOのワードを書いてね", border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              // todoを作成
              var myTodo = Todo(
                  title: textController.text,
                  isChecked: false,
                  creationDate: DateTime.now());
              // パラメーターとして送る
              insertFunction(myTodo);
            },
            child: Container(
              color: Colors.cyan,
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
