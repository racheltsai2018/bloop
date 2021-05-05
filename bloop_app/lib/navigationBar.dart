import 'package:bloop_app/game_main.dart';
import 'package:flutter/material.dart';
import 'package:bloop_app/homepage.dart';
import 'package:bloop_app/meditation/meditation.dart';
import 'package:bloop_app/diary.dart';
import 'package:bloop_app/setting.dart';

//navigation bar component
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

  //if index is 0 go to homepage, index 1 go to meditation, index 2 go to diary
  List<Widget> _widgetOp = <Widget>[
    homepage(),
    meditation(),
    diary(),
    MyApp(),
    setting(),
  ];

  //when tap on navigation bar icon guide to the page
  void _onItemTap(int index){
    if(index == 0) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute<void>(builder: (context) => homepage()), (Route<dynamic> route) => false,);
    } else{
      setState(() {
        _theIndex = index;
      });
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
          BottomNavigationBarItem(                  // first icon: homepage with icon
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(                //second icon: meditation with icon
            icon: Icon(Icons.self_improvement),
            label: 'Meditation',
          ),
          BottomNavigationBarItem(               //third icon: diary with icon
            icon: Icon(Icons.book_sharp),
            label: 'Journal',
          ),
          BottomNavigationBarItem(               //fourth icon: diary with minigame
            icon: Icon(Icons.sports_esports),
            label: 'Mini Game',
          ),
          BottomNavigationBarItem(               //fourth icon: diary with settings
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _theIndex,                //update index
        selectedItemColor: Colors.blue,         //when selected color turn blue
        onTap: _onItemTap,
      )
    );
  }
}
