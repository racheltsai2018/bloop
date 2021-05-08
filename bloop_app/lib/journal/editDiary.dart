import 'package:bloop_app/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bloop_app/journal/DbHelper.dart';
import 'package:bloop_app/journal/diaryEntry.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloop_app/journal/diaryEntry.dart';

class editDiary extends StatefulWidget {
  final diaryEntry currentEntry;
  editDiary(this.currentEntry) ;
  @override
  _editDiaryState createState() => new _editDiaryState(currentEntry);
}

class _editDiaryState extends State<editDiary>{
  diaryEntry currentEntry;
  _editDiaryState(this.currentEntry);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black,),
        ),
        title: Text('Journal',
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
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.indigo[900],
                Colors.indigo[600],
                Colors.indigo[400],
                Colors.blue[200]
              ]
          )),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column( //body section
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                            padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15),
                            child: AutoSizeText(
                                'Diary Date: '+ currentEntry.date,
                                style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                )
                            ),          //print diary date
                          ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container( //picking emoji
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                            padding: const EdgeInsets.all(15.0),
                            child: AutoSizeText(
                                'You were feeling: ',
                                style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                            ),  // print diary emoji picked
                          ),
                      ),
                      Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                            padding: const EdgeInsets.all(15.0),
                          child: Image(
                            image : AssetImage(currentEntry.emoji),
                            height: 50.0,
                            width: 50.0,)
                            ,)
                      ),
                    ],
                  ),
                  Row(
                      children: <Widget> [
                        Expanded( //body part where it user enters what happens today
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              ),
                              padding: EdgeInsets.fromLTRB(15.0, 15, 15.0, 15.0),
                              child: AutoSizeText(  "Diary Entry: "       +                                         //print diary info
                              currentEntry.info,
                                  style: GoogleFonts.raleway(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  )
                              ),
                            ),
                          ),
                      ],
                    ),
                  Align( //delete button
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                      child: ElevatedButton.icon(                                                      //delete button
                        icon: Icon(Icons.delete_outline, size: 30.0),
                        label: Text('Delete', style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,)
                        ),
                        onPressed: () {
                          showDialog<void>(                                                           //double check user wants to delete entry
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext){
                              return AlertDialog(
                                title: Text(
                                    "Are you sure you want to delete this diary entry?",
                                    style: GoogleFonts.raleway(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,)),
                                elevation: 35.0,
                                actions: <Widget>[
                                  FlatButton(
                                      child: Text(
                                        'Yes',
                                          style: GoogleFonts.raleway(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w600,)
                                      ),
                                      onPressed: (){
                                        DbHelper.instance.delete(currentEntry.id);
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute<void>(builder: (context) => navigationBar(theIndex: 2)),     //goes to navigationBar page then guide to diary
                                              (Route<dynamic> route) => false,
                                        );
                                      }
                                  ),
                                  FlatButton(
                                      child: Text('No',
                                          style: GoogleFonts.raleway(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w600,
                                          )
                                      ),
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      }
                                  )
                                ],
                              );
                            }
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]


            ),
          )
      ),

    );
  }
}



