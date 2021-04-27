import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bloop_app/navigationBar.dart';

class addDiary extends StatefulWidget {
  @override
  _addDiaryState createState() => new _addDiaryState();
}
class _addDiaryState extends State<addDiary>{                      //adding diary entry
  DateTime tdate = new DateTime.now();
  String pickDate;
  String currentIcon;
  List<bool> isSelected = [false, false,false,false];
  List<String> eList = ["😀","😊","😭","😡"];
  TextEditingController diaryField = new TextEditingController();

  void main() async{                                                //this method is for database
    WidgetsFlutterBinding.ensureInitialized();
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'dairy_database.db'),
      onCreate: (db,version){
        return  db.execute("CREATE TABLE diaries(date TEXT, emoji TEXT, info TEXT)",);
      },
      version: 1,
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(                                   //bar on top
        title: Text('Diary',
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
          child: Column(                                            //body section
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
                    child: FlatButton.icon(
                        icon: Icon(Icons.date_range),
                        label: Text('Pick a date for the diary'),           //date picker
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child:Text('How are you feeling today? :',style: TextStyle(backgroundColor: Colors.white, fontSize: 27.0),),
                      ),
                      Expanded(
                        child:ToggleButtons(                                  //emoji button
                          selectedColor: Colors.white,
                          fillColor: Colors.blue,
                          children: <Widget>[
                            Text("😀", style: TextStyle(fontSize: 25.0),),
                            Text("😊", style: TextStyle(fontSize: 25.0),),
                            Text("😭", style: TextStyle(fontSize: 25.0),),
                            Text("😡", style: TextStyle(fontSize: 25.0),),
                          ],
                          onPressed: (int index){
                            setState((){
                              for (int buttonIndex =0; buttonIndex < isSelected.length; buttonIndex++){
                                if(buttonIndex == index){
                                  isSelected[buttonIndex] = !isSelected[buttonIndex];
                                  currentIcon = eList[index];
                                } else{
                                  isSelected[buttonIndex] = false;
                                }
                              }
                            });
                          },
                          isSelected: isSelected,
                        ),
                      ),
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
                        hintText: 'What happened today?',
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
                      label: Text('submit', style: TextStyle(fontSize: 20.0)),
                      onPressed: (){
                        final DiaryEntry newEntry = new DiaryEntry(date:pickDate, emoji: currentIcon, info: diaryField.text);
                        insert(newEntry);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute<void>(builder: (context) => navigationBar(theIndex: 2)),     //goes to navigationBar page then guide to diary
                              (Route<dynamic> route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
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
// diary entry class
class DiaryEntry {
  final String date;
  final String emoji;
  final String info;

  DiaryEntry({this.date, this.emoji, this.info});

  Map<String, dynamic> toMap() => <String, dynamic>{
    'date': date,
    'emoji': emoji,
    'info': info,
  };
}
//insert into database
Future<void> insert(DiaryEntry diary) async{
  final Database db = await database;

  await db.insert(
    'diaries',
    diary.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
//gets list of diary from database
Future<List<DiaryEntry>> diaries() async{
  final Database db = await database;

  final List<Map<String, dynamic>> maps = await db.query('diaries');

  return List.generate(maps.length, (i) {
    return DiaryEntry(
      date: maps[i]['date'].toString(),
      emoji: maps[i]['emoji'].toString(),
      info: maps[i]['info'].toString(),
    );
  });
}


Database database;
