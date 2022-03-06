import 'package:flutter/material.dart';

import '../model/todo_model.dart';

class TodoCard extends StatefulWidget {
  final int id;
  final String title;
  final DateTime creationDate;
  late bool isChecked;
  final Function insertFunction;
  final Function deleteFunction;

  TodoCard(
      {Key? key,
      required this.id,
      required this.title,
      required this.isChecked,
      required this.creationDate,
      // チェックボックスの押下で変更
      required this.insertFunction,
      //デリートボタンで制御
      required this.deleteFunction})
      : super(key: key);

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    var anotherTodo = Todo(
        id: widget.id,
        title: widget.title,
        isChecked: widget.isChecked,
        creationDate: widget.creationDate);
    return Card(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Checkbox(
              value: widget.isChecked,
              onChanged: (bool? value) {
                setState(() {
                  widget.isChecked = value!;
                });
                // anotherTodoのisCheckの値を変更する
                anotherTodo.isChecked = value!;
                widget.insertFunction(anotherTodo);
              },
            ),
          ),
          //タイトルとデータ
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.creationDate.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8F8F8F),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              // delete
              widget.deleteFunction(anotherTodo);
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
    );
  }
}
