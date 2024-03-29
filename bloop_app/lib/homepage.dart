import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bloop_app/navigationBar.dart';
import 'package:auto_size_text/auto_size_text.dart';
//homepage of the application
class homepage extends StatefulWidget{
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage>{
  MediaQueryData queryData;
  @override
  Widget build(BuildContext context){
    queryData = MediaQuery.of(context);
    return Scaffold(
        appBar:AppBar(                                          // the appbar on the top of the screen
          title:Text('bloop',                                   //title centered on the page
            style: GoogleFonts.raleway(
                color: Colors.white,
                fontSize: 25.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: Colors.indigo[400],
          elevation: 30.0,
        ),
        drawer: Drawer(//drawer on the left side
            child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(                                 //drawer text on the very top
                    decoration: BoxDecoration(
                      color: Colors.white38,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'bloop',
                          style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: 45,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          child: new Image.asset('assets/images/Happy_Bloop.png', width: 125, height: 125),
                        )
                      ],
                    ),
                  ),
                  ListTile(                                     //the first page listed in drawer (meditation)
                    leading: Icon(
                        Icons.self_improvement,
                      size: 40,
                    ),
                    title: Text(
                        'Meditation',
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: (){                                  // when tap to meditation page
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<void>(builder: (context) => navigationBar(theIndex: 1)),      //goes to navigationBar page then guide to meditation page
                            (Route<dynamic> route) => false,
                      );
                    },
                  ),
                  ListTile(                                    //second page in the drawer
                    leading: Icon(
                        Icons.book_sharp,
                      size: 40
                    ),
                    title: Text(
                        "Journal",
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: (){                                //when tapped to dairy page
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<void>(builder: (context) => navigationBar(theIndex: 2)),  //goes to navigationBar page then guide to diary
                            (Route<dynamic> route) => false,
                      );
                    },
                  ),
                  ListTile(                                  //mini game button in drawer
                    leading: Icon(Icons.sports_esports, size: 40),
                    title: Text(
                        "Mini Game",
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap:(){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<void>(builder: (context) => navigationBar(theIndex: 3)), //goes to navigationBar page then guide to meditation
                            (Route<dynamic> route) => false,
                      );
                    },
                  ),
                  ListTile(                                  //mini game button in drawer
                    leading: Icon(Icons.settings, size: 40),
                    title: Text(
                      "Settings",
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap:(){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<void>(builder: (context) => navigationBar(theIndex: 4)), //goes to navigationBar page then guide to meditation
                            (Route<dynamic> route) => false,
                      );
                    },
                  ),
                ]
            )
        ),
        body: Container(                                      //body section of the homepage
            decoration: BoxDecoration(gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.indigo[900],
                  Colors.indigo[600],
                  Colors.indigo[400],
                  Colors.blue[200]]
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Row(                                          // first row of icon on the homepage
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(                               //meditation button with meditation text
                        onPressed: (){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute<void>(builder: (context) => navigationBar(theIndex: 1)), //goes to navigationBar page then guide to meditation
                                (Route<dynamic> route) => false,
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.self_improvement,
                              color: Colors.blueGrey[200],
                              size: MediaQuery.of(context).size.width/4,
                            ),
                            AutoSizeText (
                                "Meditation",
                              style: GoogleFonts.raleway(
                                color: Colors.blueGrey[100],
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        )
                    ),
                    FlatButton(                             //diary button with diary text
                        onPressed: (){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute<void>(builder: (context) => navigationBar(theIndex: 2)),     //goes to navigationBar page then guide to diary
                                (Route<dynamic> route) => false,
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.book_sharp,
                              color: Colors.blueGrey[200],
                              size: MediaQuery.of(context).size.width/4,
                            ),
                            AutoSizeText (
                                "Journal",
                              style: GoogleFonts.raleway(
                                color: Colors.blueGrey[100],
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        )
                    ),
                  ],
                ),
                Row(                                       //second row of icons
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(                           //mini game button
                        onPressed: (){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute<void>(builder: (context) => navigationBar(theIndex: 3)), //goes to navigationBar page then guide to meditation
                                (Route<dynamic> route) => false,
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.sports_esports,
                              color: Colors.blueGrey[200],
                              size: MediaQuery.of(context).size.width/4,),
                            AutoSizeText (
                                "Mini Game",
                              style: GoogleFonts.raleway(
                                color: Colors.blueGrey[100],
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        )
                    ),
                    FlatButton(                         //settings button
                        onPressed: (){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute<void>(builder: (context) => navigationBar(theIndex: 4)), //goes to navigationBar page then guide to meditation
                                (Route<dynamic> route) => false,
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.settings,
                              color: Colors.blueGrey[200],
                              size: MediaQuery.of(context).size.width/4,),
                            AutoSizeText (
                                "Settings",
                              style: GoogleFonts.raleway(
                                color: Colors.blueGrey[100],
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        )
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: new Image.asset('assets/images/Happy_Bloop.png',
                          width: MediaQuery.of(context).size.width/1.75,
                          height: MediaQuery.of(context).size.width/1.75,
                        ),
                      )
                    ]
                ),
              ],

            )

        )
    );
  }
}
