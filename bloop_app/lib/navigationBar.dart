
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

            icon: Icon(Icons.sports_esports),
            label: 'Mini game',
          ),
        ],

        onTap: _onItemTap,
      )
    );
  }
}
