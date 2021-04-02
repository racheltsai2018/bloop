import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bloop_test/homepage.dart';
import 'package:bloop_test/diary.dart';

class meditation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditation',
            style: GoogleFonts.fascinate(
                color: Colors.black, fontSize: 25.0
            )
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[100],
        elevation: 30.0,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.indigo[900],
              Colors.blue[900],
              Colors.blue,
              Colors.white
            ]
        )),

      ),

    );
  }
}