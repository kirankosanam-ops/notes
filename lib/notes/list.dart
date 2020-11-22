import 'package:notes/notes/notes_structure.dart';
import 'package:sqflite/sqflite.dart';

import 'db_file.dart';

 List<NotesStructure> notesList = List<NotesStructure>();

Future<Database> database;

