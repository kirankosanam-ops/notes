import 'package:flutter/material.dart';
import 'package:notes/Screens/home_screen.dart';
import 'package:notes/notes/db_file.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'notes/list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = openDatabase(
    join(await getDatabasesPath(), 'notes_database.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, text TEXT)",
      );
    },
    version: 1,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:HomeScreen()
    );
  }
}
