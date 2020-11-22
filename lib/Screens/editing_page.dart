import 'package:flutter/material.dart';
import 'package:notes/notes/db_file.dart';
import 'package:notes/notes/list.dart';
import 'package:notes/notes/notes_structure.dart';
import 'package:sqflite/sqflite.dart';

class EditingPage extends StatefulWidget {
  final String title;
  final String text;

  EditingPage({this.title, this.text});

  @override
  _EditingPageState createState() => _EditingPageState();
}

class _EditingPageState extends State<EditingPage> {
  int id = 0;
  final titleController = TextEditingController();
  final textController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    titleController.text = widget.title;
    textController.text = widget.text;

    // void getId() async {
    //   final Database db = await database;
    //   id = Sqflite.firstIntValue(
    //       await db.rawQuery('SELECT COUNT(*) FROM notes'));
    // }

    void saveNote() async {
      print(titleController.text);
      print(textController.text);

      // getId();
      print(id);
      final note = NotesStructure(
        id: 0,
        title: titleController.text,
        text: textController.text,
      );

      await insertNote(note);
      getNotes();


      Navigator.pop(context);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 30.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        saveNote();
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2.0),
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.blue,
                          size: 15.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        saveNote();
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2.0),
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.done,
                          color: Colors.blue,
                          size: 15.0,
                        ),
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  TF(
                    controller: titleController,
                    textColor: Colors.lightBlue,
                    fontSize: 27.0,
                    topPadding: 0,
                    hintText: "Untitled",
                  ),
                  TF(
                    controller: textController,
                    textColor: Colors.black,
                    fontSize: 18.0,
                    topPadding: 11,
                    hintText: "Start Here!!!",
                  ),

                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class TF extends StatelessWidget {
  const TF({
    Key key,
    @required this.controller,
    this.textColor,
    this.fontSize,
    this.hintText,
    this.topPadding,
  }) : super(key: key);

  final TextEditingController controller;
  final Color textColor;
  final double fontSize;
  final String hintText;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.lightBlue,
      style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Karla'),
      maxLines: null,
      keyboardType: TextInputType.multiline,
      textCapitalization: TextCapitalization.sentences,
      decoration: new InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: topPadding, right: 15),
          hintText: hintText),
    );
  }
}
