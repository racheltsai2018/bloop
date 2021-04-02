<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homepage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar:AppBar(
          title:Text('bloop',
              style: GoogleFonts.fascinate(
                  color: Colors.black, fontSize: 25.0
              )
          ),
          centerTitle: true,
          backgroundColor: Colors.white38,
          elevation: 30.0,
          leading:Icon(Icons.menu, color:Colors.black),
        ),
        body: Container(
            decoration: BoxDecoration(gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.indigo[900], Colors.blue[900], Colors.blue, Colors.white]
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                        onPressed: (){},
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.self_improvement,color: Colors.grey,
                              size: 170.0,),
                            Text ("Meditation", style: TextStyle(fontSize: 25.0))
                          ],
                        )
                    ),
                    FlatButton(
                        onPressed: (){},
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.book_sharp,color: Colors.grey,
                              size: 170.0,),
                            Text ("Diary", style: TextStyle(fontSize: 25.0))
                          ],
                        )
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                        onPressed: (){},
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.sports_esports,color: Colors.grey,
                              size: 170.0,),
                            Text ("Mini Game", style: TextStyle(fontSize: 25.0))
                          ],
                        )
                    ),
                    FlatButton(
                        onPressed: (){},
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.settings,color: Colors.grey,
                              size: 170.0,),
                            Text ("Settings", style: TextStyle(fontSize: 25.0))
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
=======
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bloop_test/navigationBar.dart';

class homepage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:Text('bloop',
        style: GoogleFonts.fascinate(
          color: Colors.black, fontSize: 25.0
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[100],
        elevation: 30.0,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
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
              ListTile(
                leading: Icon(Icons.self_improvement),
                title: Text('Meditation'),
                onTap: (){
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(builder: (context) => navigationBar(theIndex: 1)),
                        (Route<dynamic> route) => false,
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.book_sharp),
                title: Text("Diary"),
                onTap: (){
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(builder: (context) => navigationBar(theIndex: 2)),
                        (Route<dynamic> route) => false,
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.sports_esports),
                title: Text("Mini Game"),
              ),
            ]
          )
        ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.indigo[900], Colors.blue[900], Colors.blue, Colors.white]
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<void>(builder: (context) => navigationBar(theIndex: 1)),
                            (Route<dynamic> route) => false,
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.self_improvement,color: Colors.grey,
                          size: 170.0,),
                        Text ("Meditation", style: TextStyle(fontSize: 25.0))
                      ],
                    )
                ),
                FlatButton(
                    onPressed: (){
                       Navigator.pushAndRemoveUntil(
                         context,
                         MaterialPageRoute<void>(builder: (context) => navigationBar(theIndex: 2)),
                           (Route<dynamic> route) => false,
                       );
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.book_sharp,color: Colors.grey,
                          size: 170.0,),
                        Text ("Diary", style: TextStyle(fontSize: 25.0))
                      ],
                    )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                    onPressed: (){},
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.sports_esports,color: Colors.grey,
                          size: 170.0,),
                        Text ("Mini Game", style: TextStyle(fontSize: 25.0))
                      ],
                    )
                ),
                FlatButton(
                    onPressed: (){},
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.settings,color: Colors.grey,
                          size: 170.0,),
                        Text ("Settings", style: TextStyle(fontSize: 25.0))
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
>>>>>>> 013d9f043dbe07b2ec04831614c9ec162840331c
