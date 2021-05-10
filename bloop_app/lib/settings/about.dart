import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:bloop_app/homepage.dart';
import 'package:bloop_app/meditation/meditation.dart';
import 'package:flutter/material.dart';

class about extends StatelessWidget {

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
        title: Text('About',
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
            Align(                                              
                alignment: Alignment.center,
                child:Container(
                  padding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, .0),
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: ListTile(
                    title: Text('Why bloop?', textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 25.0,
                        )
                    ),
                  ),
                )
            ),
            Padding(padding: EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0)),
            Align(                                             
                alignment: Alignment.center,
                child:Container(
                  child: new Image.asset('assets/images/bloopPlayer.png', width: 180, height: 180),
                )
            ),
            Padding(padding: EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0)),
            Align(                                              
                alignment: Alignment.center,
                child:Container(
                  padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: ListTile(
                    subtitle: Text('Bloop focuses on helping users to cope with stress. This minimalistic application offers a simple mini-game, a journal, and several audios for meditation.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 20.0,
                        )
                  ),
                )
            ),
            )
          ],
        ),
      ),);
  }
}
