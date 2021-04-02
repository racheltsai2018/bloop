import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bloop_app/homepage.dart';
import 'package:bloop_app/meditation.dart';
import 'package:bloop_app/diary.dart';

class navigationBar extends StatefulWidget {
  int theIndex;
  navigationBar({ @required this.theIndex});

  @override
  State<StatefulWidget> createState(){
    return _navigationBarState();
  }
}

class _navigationBarState extends State<navigationBar>{
  final bool showBar = false;
  int _theIndex;
  @override
  void initState(){
    _theIndex = widget.theIndex;
  }

  List<Widget> _widgetOp = <Widget>[
    homepage(),
    meditation(),
    diary(),
  ];

  void _onItemTap(int index){
    if(_theIndex != 0) {
      setState(() {
        _theIndex = index;
      });
    } else{
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute<void>(builder: (context) => homepage()), (Route<dynamic> route) => false,);
    }
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _widgetOp[_theIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.blueGrey[100],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Homepage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.self_improvement),
            label: 'Meditation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_sharp),
            label: 'diary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_esports),
            label: 'Mini game',
          ),
        ],
        currentIndex: _theIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTap,
      )
    );
  }
}
