import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:bloop_app/homepage.dart';
import 'package:bloop_app/meditation/meditation.dart';
import 'package:flutter/material.dart';

class team extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black,),
        ),//bar on top
        title: Text('Team',
            style: GoogleFonts.raleway(
              color: Colors.black,
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
                  padding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, .0),
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    border: Border.all(color: Colors.black),
                  ),
                  child: ListTile(
                    title: Text('Nada Attar', textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0)),
                    subtitle: Text('Project Advisor', textAlign: TextAlign.center,style: TextStyle(fontSize: 15.0)),
                  ),
                )
            ),
            Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0)),
            Align(                                                //plus button to add diary page
                alignment: Alignment.center,
                child:Container(
                  padding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    border: Border.all(color: Colors.black),
                  ),
                  child: ListTile(
                    title: Text('Denise Gip', textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0)),
                    subtitle: Text('Full Stack Developer | Game Design Developer', textAlign: TextAlign.center,style: TextStyle(fontSize: 15.0)),
                  ),
                )
            ),
            Padding(padding: EdgeInsets.fromLTRB(2.0, 2.0, 0, 2.0)),
            Align(                                                //plus button to add diary page
                alignment: Alignment.center,
                child:Container(
                  padding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    border: Border.all(color: Colors.black),
                  ),
                  child: ListTile(
                    title: Text('Rachel Tsai', textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0)),
                    subtitle: Text('Full Stack Developer | Database Developer', textAlign: TextAlign.center,style: TextStyle(fontSize: 15.0)),
                  ),
                )
            ),
            Padding(padding: EdgeInsets.fromLTRB(2.0, 2.0, 0, 2.0)),
            Align(                                                //plus button to add diary page
                alignment: Alignment.center,
                child:Container(
                  padding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    border: Border.all(color: Colors.black),
                  ),
                  child: ListTile(
                    title: Text('Irina Voronova', textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0)),
                    subtitle: Text('Full Stack Developer | Lead Game Developer', textAlign: TextAlign.center,style: TextStyle(fontSize: 15.0)),
                  ),
                )
            ),
            Padding(padding: EdgeInsets.fromLTRB(2.0, 2.0, 0, 2.0)),
            Align(                                                //plus button to add diary page
                alignment: Alignment.center,
                child:Container(
                  padding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    border: Border.all(color: Colors.black),
                  ),
                  child: ListTile(
                    title: Text('Jennifer Yang', textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0)),
                    subtitle: Text('Full Stack Developer | Project Manager', textAlign: TextAlign.center,style: TextStyle(fontSize: 15.0)),
                  ),
                )
            ),
          ],
        ),
      ),);
  }
}