import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bloop_app/meditation/custom_list_tile.dart';
import 'package:bloop_app/meditation/music_player.dart';
//meditation page
class meditation extends StatelessWidget {
  int currentIndex = 0;
  final GlobalKey<MusicPlayerState> key = GlobalKey<MusicPlayerState>();
  List musicList = [
    {
      'title': "Morning Birds",
      'url': "https://assets.mixkit.co/sfx/preview/mixkit-morning-birds-2472.mp3",
      'coverUrl': "https://images.pexels.com/photos/792416/pexels-photo-792416.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500 500w, https://images.pexels.com/photos/792416/pexels-photo-792416.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500 1000w",

    },
    {
      'title': "River Forest",
      'url' : "https://dm0qx8t0i9gc9.cloudfront.net/previews/audio/BsTwCwBHBjzwub4i4/river-forest_zJh2TjVu_NWM.mp3",
      'coverUrl' : "https://images.pexels.com/photos/775201/pexels-photo-775201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
    }
  ];

  //changes the track if the prev or next button is pressed in music player
  void changeTrack(bool isNext){
    if(isNext){
      if(currentIndex != musicList.length - 1){
        currentIndex++;
      }
    } else {
      if(currentIndex != 0){
        currentIndex--;
      }
    }
    key.currentState.setSong(musicList[currentIndex]['title'], musicList[currentIndex]['url'], musicList[currentIndex]['coverUrl']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(                    // appbar
        title: Text('Meditation',
            style: GoogleFonts.fascinate(
                color: Colors.black, fontSize: 25.0
            )
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[100],
        elevation: 30.0,
      ),
      body: Container(                            // body
        decoration: BoxDecoration(gradient: LinearGradient( // make background gradient
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
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: musicList.length,
                itemBuilder: (context, index) => customListTile(
                  onTap: (){
                    currentIndex = index;
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MusicPlayer(
                      title: musicList[currentIndex]['title'],
                      cover: musicList[currentIndex]['coverUrl'],
                      audioUrl: musicList[currentIndex]['url'],
                      changeTrack: changeTrack,
                      key: key,
                    )));
                  },
                  title: musicList[index]['title'],
                  cover: musicList[index]['coverUrl'],
                ),),
            ),
          ],
        ),
      ),


    );
  }
}
