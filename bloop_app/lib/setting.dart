import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//setting page
class setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(                    // appbar
        title: Text('Settings',
            style: GoogleFonts.raleway(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
            )
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[100],
        elevation: 30.0,
      ),
      body: Container(                            // body
        decoration: BoxDecoration(gradient: LinearGradient( // make background gradient
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
