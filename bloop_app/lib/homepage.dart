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
            style: GoogleFonts.fascinate(
                color: Colors.black, fontSize: 25.0
            ),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[100],
          elevation: 30.0,
        ),
        drawer: Drawer(                                         //drawer on the left side
            child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(                                 //drawer text on the very top
                    decoration: BoxDecoration(
                      color: Colors.white38,
                    ),
                    child: Text(
                      'header',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(                                     //the first page listed in drawer (meditation)
                    leading: Icon(Icons.self_improvement),
                    title: Text('Meditation'),
                    onTap: (){                                  // when tap to meditation page
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<void>(builder: (context) => navigationBar(theIndex: 1)),      //goes to navigationBar page then guide to meditation page
                            (Route<dynamic> route) => false,
                      );
                    },
                  ),
                  ListTile(                                    //second page in the drawer
                    leading: Icon(Icons.book_sharp),
                    title: Text("Diary"),
                    onTap: (){                                //when tapped to dairy page
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<void>(builder: (context) => navigationBar(theIndex: 2)),  //goes to navigationBar page then guide to diary
                            (Route<dynamic> route) => false,
                      );
                    },
                  ),
                  ListTile(                                  //mini game button in drawer
                    leading: Icon(Icons.sports_esports),
                    title: Text("Mini Game"),
                    onTap:(){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<void>(builder: (context) => navigationBar(theIndex: 3)), //goes to navigationBar page then guide to meditation
                            (Route<dynamic> route) => false,
                      );
                    },
                  ),
                  ListTile(                                  //mini game button in drawer
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
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
                colors: [Colors.indigo[900], Colors.blue[900], Colors.blue, Colors.white]
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
                            Icon(Icons.self_improvement,color: Colors.grey,
                              size: MediaQuery.of(context).size.width/4,),
                            AutoSizeText ("Meditation", style: TextStyle(fontSize: 25.0))
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
                            Icon(Icons.book_sharp,color: Colors.grey,
                              size: MediaQuery.of(context).size.width/4,),
                            AutoSizeText ("Diary", style: TextStyle(fontSize: 25.0))
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
                            Icon(Icons.sports_esports,color: Colors.grey,
                              size: MediaQuery.of(context).size.width/4,),
                            AutoSizeText ("Mini Game", style: TextStyle(fontSize: 25.0))
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
                            Icon(Icons.settings,color: Colors.grey,
                              size: MediaQuery.of(context).size.width/4,),
                            AutoSizeText ("Settings", style: TextStyle(fontSize: 25.0))
                          ],
                        )
                    ),
                  ],
                )
              ],

            )

        )
    );
  }
}
