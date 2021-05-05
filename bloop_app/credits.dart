import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class credits extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(                              //bar on top
        title: Text('Credits',
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
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(15.0, 15.0, 0, 15.0)),
            Align(                                                //plus button to add diary page
                alignment: Alignment.center,
                child:Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: ListTile(
                    title: Text('Package Used', style: TextStyle(fontSize: 20.0)),
                  ),
                )
            ),
            Padding(padding: EdgeInsets.fromLTRB(1.5, 1.5, 0, 1.5)),
            Align(                                                //plus button to add diary page
                child:Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: ListTile(
                    title: Text('Auto Size Text', style: TextStyle(fontSize: 15.0)),
                    leading: Icon(Icons.star),
                  ),
                )
            ),
            Align(                                                //plus button to add diary page
                child:Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: ListTile(
                    title: Text('Google Fonts', style: TextStyle(fontSize: 15.0)),
                    leading: Icon(Icons.star),
                  ),
                )
            ),
            Align(                                                //plus button to add diary page
                child:Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: ListTile(
                    title: Text('Flame Game Engine', style: TextStyle(fontSize: 15.0)),
                    leading: Icon(Icons.star),
                  ),
                )
            ),
            Align(                                                //plus button to add diary page
                child:Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: ListTile(
                    title: Text('Just Audio', style: TextStyle(fontSize: 15.0)),
                    leading: Icon(Icons.star),
                  ),
                )
            ),
            Align(                                                //plus button to add diary page
                child:Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: ListTile(
                    title: Text('Path', style: TextStyle(fontSize: 15.0)),
                    leading: Icon(Icons.star),
                  ),
                )
            ),
            Align(                                                //plus button to add diary page
                child:Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: ListTile(
                    title: Text('Setting UI', style: TextStyle(fontSize: 15.0)),
                    leading: Icon(Icons.star),
                  ),
                )
            ),
            Align(                                                //plus button to add diary page
                child:Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: ListTile(
                    title: Text('SQFlite', style: TextStyle(fontSize: 15.0)),
                    leading: Icon(Icons.star),
                  ),
                )
            ),
          ],
        ),
      ),);
  }
}