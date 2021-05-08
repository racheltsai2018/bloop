import 'package:bloop_app/journal/addDiary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bloop_app/journal/diaryEntry.dart';
import 'package:bloop_app/journal/DbHelper.dart';
import 'package:bloop_app/journal/editDiary.dart';


class diary extends StatefulWidget{
  @override
  _diaryState createState() => new _diaryState();
}

class _diaryState extends State<diary>{
  int i=0;
  List<diaryEntry> allDiary = new List();

  @override
  //initialize database
  void initState(){
    super.initState();

    DbHelper.instance.queryAllRows().then((value){
      setState((){
        value.forEach((element){
          allDiary.add(diaryEntry(id: element['id'] as int, date: element['date'] as String, emoji: element['emoji'] as String, info: element['info'] as String));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(                              //bar on top
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
        child: Column(                                      
          children: <Widget>[
            Align(                                                //plus button to add diary page
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
                child: RawMaterialButton(
                  elevation: 5.0,
                  fillColor: Colors.blueGrey[100],
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
           SizedBox(height: 10),                                    //gets diary entries when new entries are added
            Expanded(
              child:Container(
                padding: EdgeInsets.all(8),
                child: allDiary.isEmpty ? Container()
                    :ListView.builder(itemBuilder: (ctx, index){
                      if(index == allDiary.length) return null;
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        child: ListTile(
                          title: Text('Date:' +allDiary[index].date),
                          leading: Image(
                            image : AssetImage(allDiary[index].emoji),
                            height: 40.0,
                            width: 40.0,),
                          trailing: Icon(Icons.info),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute<void>(builder: (context) => editDiary(allDiary[index])));
                          }
                        ),
                      );
                })
              )
            )
          ],
        ),
    ),);
  }
}
