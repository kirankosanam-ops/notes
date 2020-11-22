import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes/Widgets/notes_tile.dart';
import 'package:notes/constants/color_constants.dart';
import 'package:notes/notes/db_file.dart';
import 'package:notes/notes/list.dart';
import 'package:notes/notes/notes_structure.dart';
import 'package:sqflite/sqflite.dart';

import 'editing_page.dart';

// for re editing notes first delete the current one after passing title and text to the editing page adn when press back or done add that note to the list

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int titleLength = 0;
  String noteTitle;
  String noteText;
  int id;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    NotesStructure note;

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xff0E121B),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Notes',
                    style: TextStyle(color: Colors.white, fontSize: 35.0),
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: screenHeight - 130,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: notesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      NotesStructure note = notesList[index];
                      noteTitle = note.title;
                      noteText = note.text;
                      id = note.id;
                      titleLength = note.title.length;
                      return GestureDetector(
                        onDoubleTap: () {
                          deleteNote(note.id);
                        },
                        onTap: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditingPage(
                                  title: noteTitle,
                                  text: noteText,
                                ),
                              ),
                            );
                          });
                        },
                        child: NotesTile(
                            screenWidth: screenWidth,
                            screenHeight: titleLength > 20 ? 250 : 100,
                            noteTitle: noteTitle),
                      );
                    },
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(2, titleLength > 20 ? 3 : 2),
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 0.0,
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: screenHeight - 75,
          left: screenWidth - 75,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditingPage()));
              print("New Notes Created!");
              },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  // borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  shape: BoxShape.circle),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              width: 55,
              height: 55,
            ),
          ),
        ),
      ]),
    );
  }
}
