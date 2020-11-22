import 'package:flutter/material.dart';


class NotesTile extends StatelessWidget {
  const NotesTile({
    Key key,
    @required this.screenWidth,
    @required this.screenHeight,
    @required this.noteTitle
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;
  final String noteTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xff171C26),
            boxShadow: [BoxShadow(
              offset: Offset(
                3.0,
                3.0,
              ),
              color: Colors.blue,
              blurRadius: 25.0,
              spreadRadius: 2.0
            )],
            borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        width: screenWidth / 2.5,
        height: screenHeight / 4,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text( noteTitle,style:TextStyle(fontSize: 22.0,color: Colors.white)),
        ),
      ),
    );
  }
}
