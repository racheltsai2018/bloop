import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class credits extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white,),
        ), //bar on top
        title: Text('Credits',
            style: GoogleFonts.raleway(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
            )
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo[400],
        elevation: 30.0,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.indigo[900],
              Colors.indigo[600],
              Colors.indigo[400],
              Colors.blue[200]
            ]
        )),
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(15.0, 15.0, 0, 15.0)),
            Align(                                                //plus button to add diary page
                alignment: Alignment.center,
                child:Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    //border: Border.all(color: Colors.black),
                  ),
                  child: ListTile(
                    title: Text('Flutter Packages Used', style: TextStyle(fontSize: 20.0)),
                  ),
                )
            ),
            Padding(padding: EdgeInsets.fromLTRB(1.5, 1.5, 0, 1.5)),
            Align(                                                //plus button to add diary page
                child:Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    //border: Border.all(color: Colors.black),
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
                    color: Colors.yellow[700],
                    //border: Border.all(color: Colors.black),
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
                    color: Colors.yellow[700],
                    //border: Border.all(color: Colors.black),
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
                    color: Colors.yellow[700],
                    //border: Border.all(color: Colors.black),
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
                    color: Colors.yellow[700],
                    //border: Border.all(color: Colors.black),
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
                    color: Colors.yellow[700],
                    //border: Border.all(color: Colors.black),
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
                    color: Colors.yellow[700],
                    //border: Border.all(color: Colors.black),
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