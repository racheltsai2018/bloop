import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bloop_app/meditation/custom_list_tile.dart';
import 'package:bloop_app/meditation/music_player.dart';
import 'package:bloop_app/meditation/music_player_2.dart';
// //meditation page
// so implementation is kinda jank so idk what issues we might come across later
// but it works for now so let's roll with it
// -Denise
class meditation extends StatelessWidget {
  int currentIndex = 0;

  //keys are used to access methods in this file for music players (i.e. change tracks)
  final GlobalKey<MusicPlayerState> key = GlobalKey<MusicPlayerState>();
  final GlobalKey<MusicPlayerState2> key2 = GlobalKey<MusicPlayerState2>();

  //audio list for guided meditation
  List musicList = [
    {
      'title': "3 Minute Body & Sound Mediation",
      'artist' : 'UCLA Health',
      'url': "https://www.uclahealth.org/marc/mpeg/Body-Sound-Meditation.mp3",
      'coverUrl': "https://images.pexels.com/photos/289586/pexels-photo-289586.jpeg",

    },
    {
      'title': "5 Minute Breathing Meditation",
      'artist' : 'UCLA Health',
      'url' : "https://www.uclahealth.org/marc/mpeg/01_Breathing_Meditation.mp3",
      'coverUrl' : "https://images.pexels.com/photos/268020/pexels-photo-268020.jpeg"
    },
    {
      'title': "12 Minute Breath, Sound, Body, \nMeditation",
      'artist' : 'UCLA Health',
      'url' : "https://www.uclahealth.org/marc/mpeg/02_Breath_Sound_Body_Meditation.mp3",
      'coverUrl' : "https://images.pexels.com/photos/668353/pexels-photo-668353.jpeg"
    }
  ];

  //audio list for non-guided meditation
  List musicList2 = [
    {
      'title': "Morning Birds",
      'artist' : '',
      'url': "https://assets.mixkit.co/sfx/preview/mixkit-morning-birds-2472.mp3",
      'coverUrl': "https://images.pexels.com/photos/792416/pexels-photo-792416.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500 500w, https://images.pexels.com/photos/792416/pexels-photo-792416.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500 1000w",

    },
    {
      'title': "River Forest",
      'artist' : '',
      'url' : "https://dm0qx8t0i9gc9.cloudfront.net/previews/audio/BsTwCwBHBjzwub4i4/river-forest_zJh2TjVu_NWM.mp3",
      'coverUrl' : "https://images.pexels.com/photos/775201/pexels-photo-775201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
    },
    {
      'title': "Tune Thai",
      'artist' : 'Kamil Guszczynski',
      'url' : "https://dm0qx8t0i9gc9.cloudfront.net/watermarks/audio/B4tjPOdirk2w6jiw6/audioblocks-tune-thai_ShWP_S9PU_WM.mp3",
      'coverUrl' : "https://images.pexels.com/photos/957024/forest-trees-perspective-bright-957024.jpeg"
    },
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
    key.currentState.setSong(musicList[currentIndex]['title'], musicList[currentIndex]['artist'], musicList[currentIndex]['url'], musicList[currentIndex]['coverUrl']);
  }

  void changeTrack2(bool isNext){
    if(isNext){
      if(currentIndex != musicList.length - 1){
        currentIndex++;
      }
    } else {
      if(currentIndex != 0){
        currentIndex--;
      }
    }
    key2.currentState.setSong(musicList2[currentIndex]['title'], musicList2[currentIndex]['artist'], musicList2[currentIndex]['url'], musicList2[currentIndex]['coverUrl']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(                    // appbar
        title: Text('Meditation',
            style: GoogleFonts.raleway(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
            )
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo[400],
        elevation: 30.0,
      ),
      body: Container(                            // body
        decoration: BoxDecoration(gradient: LinearGradient( // make background gradient
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
          children: [
            //displays text
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              child: Text('Guided Meditation',
                textAlign: TextAlign.left,
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            //Generates and displays list of audio for guided meditation
            Expanded(
              child: ListView.builder(
                itemCount: musicList.length,
                itemBuilder: (context, index) => customListTile(
                  onTap: (){
                    currentIndex = index; //sets the index so it knows what to display in music_player
                    //passes the information of the selected song to music_player
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MusicPlayer(
                      title: musicList[currentIndex]['title'],
                      cover: musicList[currentIndex]['coverUrl'],
                      audioUrl: musicList[currentIndex]['url'],
                      artist: musicList[currentIndex]['artist'],
                      changeTrack: changeTrack,
                      key: key,
                    )));
                  },

                  //passes info to customListTile to generate the list tile card thing
                  title: musicList[index]['title'],
                  cover: musicList[index]['coverUrl'],
                  artist: musicList[index]['artist'],
                  context: context,
                ),),
            ),

            //displays text
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              child: Text('Non-Guided Meditation',
                textAlign: TextAlign.left,
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            //Generates and displays list of audio for non-guided meditation
            //Literally same code as the one for guided meditation but uses different audio list
            Expanded(
              child: ListView.builder(
                itemCount: musicList2.length,
                itemBuilder: (context, index) => customListTile(
                  onTap: (){
                    currentIndex = index;
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MusicPlayer2(
                      title: musicList2[currentIndex]['title'],
                      cover: musicList2[currentIndex]['coverUrl'],
                      audioUrl: musicList2[currentIndex]['url'],
                      artist: musicList2[currentIndex]['artist'],
                      changeTrack2: changeTrack2,
                      key: key2,
                    )));
                  },
                  title: musicList2[index]['title'],
                  cover: musicList2[index]['coverUrl'],
                  artist: musicList2[index]['artist'],
                  context: context,
                ),),
            ),
          ],
        ),
      ),


    );
  }
}
