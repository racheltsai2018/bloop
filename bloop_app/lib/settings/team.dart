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
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white,),
        ),//bar on top
        title: Text('Team',
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
        child: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(15.0, 15.0, 0, 15.0)),
            Align(                                                
                alignment: Alignment.center,
                child:Container(
                  padding: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, .0),
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    border: Border.all(color: Colors.amber[600]),
                  ),
                  child: Column(
                    children: [
                      Container(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/images/bloopPlayer.png'),
                            radius: 50,
                          )
                      ),
                      ListTile(
                        title: Text('Nada Attar', textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0)),
                        subtitle: Text('Project Advisor', textAlign: TextAlign.center,style: TextStyle(fontSize: 15.0)),
                      ),
                    ],
                  ),
                )
            ),
            Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0)),
            Align(                                                
                alignment: Alignment.center,
                child:Container(
                  padding: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 1.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    border: Border.all(color: Colors.amber[600]),
                  ),
                  child: Column(
                    children: [
                      Container(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/team_photos/screaming_cat.jpeg'),
                            radius: 50,
                          )
                      ),
                      ListTile(
                        title: Text('Denise Gip', textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0)),
                        subtitle: Text('Mobile App Developer | Game Design Developer', textAlign: TextAlign.center,style: TextStyle(fontSize: 15.0)),
                      ),
                    ],
                  ),
                )
            ),
            Padding(padding: EdgeInsets.fromLTRB(2.0, 2.0, 0, 2.0)),
            Align(                                                
                alignment: Alignment.center,
                child:Container(
                  padding: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 1.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    border: Border.all(color: Colors.amber[600]),
                  ),
                  child: Column(
                    children: [
                      Container(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/team_photos/crying_cat4.jpeg'),
                            radius: 50,
                          )
                      ),
                      ListTile(
                        title: Text('Rachel Tsai', textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0)),
                        subtitle: Text('Mobile App Developer | Database Developer', textAlign: TextAlign.center,style: TextStyle(fontSize: 15.0)),
                      ),
                    ],
                  ),
                )
            ),
            Padding(padding: EdgeInsets.fromLTRB(2.0, 2.0, 0, 2.0)),
            Align(                                               
                alignment: Alignment.center,
                child:Container(
                  padding: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 1.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    border: Border.all(color: Colors.amber[600]),
                  ),
                  child: Column(
                    children: [
                      Container(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/team_photos/crying_cat2.jpeg'),
                            radius: 50,
                          )
                      ),
                      ListTile(
                        title: Text('Irina Voronova', textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0)),
                        subtitle: Text('Mobile App Developer | Lead Game Developer | Artist', textAlign: TextAlign.center,style: TextStyle(fontSize: 15.0)),
                      ),
                    ],
                  ),
                )
            ),
            Padding(padding: EdgeInsets.fromLTRB(2.0, 2.0, 0, 2.0)),
            Align(                                                
                alignment: Alignment.center,
                child:Container(
                  padding: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 1.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    border: Border.all(color: Colors.amber[600]),
                  ),
                  child: Column(
                    children: [
                      Container(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/team_photos/crying_cat.jpeg'),
                            radius: 50,
                          )
                      ),
                      ListTile(
                        title: Text('Jennifer Yang', textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0)),
                        subtitle: Text('Mobile App Developer | Project Manager', textAlign: TextAlign.center,style: TextStyle(fontSize: 15.0)),
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),);
  }
}
