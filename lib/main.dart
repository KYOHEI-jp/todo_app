import 'package:flutter/material.dart';
import 'package:todo_app/model/db_model.dart';
import 'package:todo_app/screens/homepage.dart';

import 'model/todo_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = DatabaseConnect();
  // サンプルを挿入
  await db.insertTodo(Todo(
    id: 1,
    title: 'これはサンプル',
    isChecked: false,
    creationDate: DateTime.now(),
  ));
  print(await db.getTodo());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
    );
  }
}
