import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/model/db_model.dart';
import 'package:todo_app/widgets/todo_card.dart';

class TodoList extends StatelessWidget {
  // データベース接続のオブジェクトを作成
  var db = DatabaseConnect();

  final Function insertFunction;
  final Function deleteFunction;

  TodoList(
      {Key? key, required this.insertFunction, required this.deleteFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getTodo(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var datalength = data!.length;

          return datalength == 0
              ? const Center(
                  child: Text("no data found"),
                )
              : ListView.builder(
                  itemCount: datalength,
                  itemBuilder: (context, i) => TodoCard(
                    id: data[i].id,
                    title: data[i].title,
                    isChecked: data[i].isChecked,
                    creationDate: data[i].creationDate,
                    insertFunction: insertFunction,
                    deleteFunction: deleteFunction,
                  ),
                );
        },
      ),
    );
  }
}
