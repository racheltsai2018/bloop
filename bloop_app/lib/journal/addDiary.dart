import 'dart:ui';

import 'package:bloop_app/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bloop_app/journal/DbHelper.dart';
import 'package:bloop_app/journal/diaryEntry.dart';
import 'package:auto_size_text/auto_size_text.dart';

class addDiary extends StatefulWidget {
  @override
  _addDiaryState createState() => new _addDiaryState();
}
class _addDiaryState extends State<addDiary>{
  bool sub = false;//adding diary entry
  DateTime tdate = new DateTime.now();
  String pickDate;
  String currentIcon;
  List<bool> isSelected = [false,false,false, false];

  TextEditingController diaryField = new TextEditingController();
  List<diaryEntry> allDiary = new List();

  // Custom Emoji Images


  List<String> bList = ['assets/images/Simple_Bloop.png',
  'assets/images/Happy_Bloop.png',
  'assets/images/Sad_Bloop.png',
  'assets/images/Angry_Bloop.png'];

  //List<String> eList = ["😁","😊","😭","😡"];
  //add entry to database
  void _addToDatabase() async{
    String textInfo = diaryField.text;
    var id = await DbHelper.instance.insert(diaryEntry(date: pickDate, emoji: currentIcon, info: textInfo));
    setState((){
        allDiary.insert(0, diaryEntry(id: id, date: pickDate, emoji: currentIcon, info: textInfo));
    });
  }

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
        //bar on top
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
          child: Column(                                            //body section
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
                    child: FlatButton.icon(
                        icon: Icon(Icons.date_range),
                        label: Text('Journal Entry Date'),           //date picker
                        color: Colors.white,
                        onPressed: () => showDatePicker(
                            context: context,
                            initialDate: tdate,
                            firstDate: DateTime(tdate.year -1, tdate.month, tdate.day),
                            lastDate: DateTime(tdate.year+1, tdate.month, tdate.day))
                            .then((date) => {
                          setState((){
                            pickDate = date.month.toString()+'/'+
                                date.day.toString()+'/'+ date.year.toString();
                          }),
                        })),
                  ),
                ),
                Padding(                                         //picking emoji
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          children: <Widget>[
                            AutoSizeText('How are you feeling today?',
                                style: GoogleFonts.raleway(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w600,
                                )
                             ),
                          ]
                      ),
                      Row(
                        children: <Widget> [
                      Expanded(
                        child:ToggleButtons(                                  //emoji button
                          selectedColor: Colors.white,
                          fillColor: Colors.blue,
                          children: const <Widget>[
                           Image(
                             image : AssetImage('assets/images/Happy_Bloop.png'),
                             height: 40.0,
                             width: 40.0,),
                            Image(
                              image : AssetImage('assets/images/Simple_Bloop.png'),
                              height: 40.0,
                              width: 40.0,),
                            Image(
                              image : AssetImage('assets/images/Sad_Bloop.png'),
                              height: 40.0,
                              width: 40.0,),
                            Image(
                              image : AssetImage('assets/images/Angry_Bloop.png'),
                              height: 40.0,
                              width: 40.0,),
                            /*Text("😁", style: TextStyle(fontSize: 25.0),),
                            Text("😊", style: TextStyle(fontSize: 25.0),),
                            Text("😭", style: TextStyle(fontSize: 25.0),),
                            Text("😡", style: TextStyle(fontSize: 25.0),),
                             */
                          ],
                          onPressed: (int index){
                            setState((){
                              for (int buttonIndex =0; buttonIndex < isSelected.length; buttonIndex++){
                                if(buttonIndex == index){
                                  isSelected[buttonIndex] = !isSelected[buttonIndex];
                                  currentIcon = bList[index];
                                } else{
                                  isSelected[buttonIndex] = false;
                                }
                              }
                            });
                          },
                          isSelected: isSelected,
                        ),
                      ),
                       ]
                      )
                    ],
                  ),
                ),
                Expanded(                                               //body part where it user enters what happens today
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 15.0),
                    child: TextField(
                      controller: diaryField,
                      textAlignVertical: TextAlignVertical.top,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      expands: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        hintText: 'How was your day?',
                        hintStyle: GoogleFonts.raleway(
                          fontSize: 20.0,
                      )
                      ),
                    ),
                  ),
                ),
                Align(                                                         //submit button
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.check, size: 30.0),
                      label: Text('Submit', style: TextStyle(fontSize: 20.0)),
                      onPressed: (){
                        if(pickDate == null){
                          showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext){
                                return AlertDialog(
                                  title: Text("Error: No date selected. Please select a date.",
                                      style: GoogleFonts.raleway(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600
                                      )),
                                  elevation: 35.0,
                                  actions: <Widget>[
                                    FlatButton(
                                        child: Text('Ok',
                                            style: GoogleFonts.raleway(
                                              fontSize: 20.0,
                                            )),
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                        }
                                    ),
                                  ],
                                );
                              }
                          );
                        } else if (currentIcon == null){
                          showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext){
                                return AlertDialog(
                                  title: Text("No emoji selected. Please select an emoji.",
                                    style: GoogleFonts.raleway(
                                    fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600
                                  )),
                                  elevation: 35.0,
                                  actions: <Widget>[
                                    FlatButton(
                                        child: Text('Ok',
                                            style: GoogleFonts.raleway(
                                              fontSize: 20.0,
                                            )),
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                        }
                                    ),
                                  ],
                                );
                              }
                          );
                        }else {
                          _addToDatabase();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute<void>(builder: (context) =>
                                navigationBar(theIndex: 2)),
                            //goes to navigationBar page then guide to diary
                                (Route<dynamic> route) => false,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ]


          )
      ),

    );
  }
}



