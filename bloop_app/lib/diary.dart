import 'package:bloop_app/addDiary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class diary extends StatefulWidget{
  @override
  _diaryState createState() => new _diaryState();
}

class _diaryState extends State<diary>{
  List<DiaryEntry> allEntry;
  int i=0;
  void main() async{
    allEntry = await diaries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
                child: RawMaterialButton(
                  elevation: 5.0,
                  fillColor: Colors.grey,
                  child: Icon(
                    Icons.add,
                    size: 30.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute<void>(builder: (context) => addDiary()));
                  },
                ),
              ),
            ),
            FutureBuilder<List>(
              future: diaries(),
              initialData: allEntry,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return Expanded(
                      child: Column(
                        children: <Widget>[
                          Text('Diary date: ${snapshot.data[i]['date']}'),
                          Text('Mood: ${snapshot.data[i]['emoji']}'),
                        ],
                      )
                  );
                }else{
                  return Text("Currently no data entry");
                }
              }
            ),
          ],
        ),
    ),);
  }
}
