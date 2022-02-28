import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'todo_model.dart';

class DatabaseConnect {
  Database? _database;

  //データベースへの接続するためのゲッター
  Future<Database> get database async {
    //データベースの位置
    final dbpath = await getDatabasesPath();
    //データベースの名前
    const dbname = 'todo.db';
    //データベースへのフルパス
    //data/data/todo.db みたいな
    final path = join(dbpath, dbname);
    //接続を開く
    _database = await openDatabase(path, version: 1, onCreate: _createDB);

    return _database!;

    Future<void> _createDB(Database db, int version) async {
      await db.execute('''
      CREATE TABLE todo(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      creationDate TEXT,
      isChecked INTEGER
      )
      ''');
    }
  }

  /*
   * データをデータベースにインサートする
   */
  Future<void> insertTodo(Todo todo) async {
    final db = await database;
    // インサートする
    await db.insert(
      'todo', // テーブルの名前
      todo.toMap(), // todo_modelのfunction
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //デリートする機能
  Future<void> deleteTodo(Todo todo) async {
    final db = await database;
    await db.delete(
      'todo',
      where: 'id == ?',
      whereArgs: [todo.id],
    );
  }

  //フェッチする機能
  Future<List<Todo>> getTodo(Todo todo) async {
    final db = await database;
    List<Map<String, dynamic>> items = await db.query(
      'todo',
      orderBy: 'id DESC',
    );

    return List.generate(
      items.length,
      (index) => Todo(
        id: items[index]['id'],
        title: items[index]['title'],
        creationDate: DateTime.parse(items[index]['creationDate']),
        isChecked: items[index]['isChecked'] == 1 ? true : false,
      ),
    );
  }
}
