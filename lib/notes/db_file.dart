import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'list.dart';
import 'notes_structure.dart';

Future<Database> dbCreation() async {

  print("Database with notes table created");
  print(database);
  return database;
}
Future<void> insertNote(NotesStructure note) async {
  final Database db = await database;
  await db.insert(
    'notes',
    note.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
void getNotes() async {
  final Database db = await database;

  final List<Map<String, dynamic>> maps = await db.query('notes');

  notesList = List.generate(maps.length, (i) {
    return NotesStructure(
      id: maps[i]['id'],
      title: maps[i]['title'],
      text: maps[i]['text'],
    );
    print("\n\n\n\n\n\n");
    print(notesList);
  });
}

Future<void> updateDog(NotesStructure note) async {
  final db = await database;
  await db.update(
    'notes',
    note.toMap(),
    where: "id = ?",
    whereArgs: [note.id],
  );
}

Future<void> deleteNote(int id) async {
  final db = await database;
  await db.delete(
    'notes',
    where: "id = ?",
    whereArgs: [id],
  );
}
