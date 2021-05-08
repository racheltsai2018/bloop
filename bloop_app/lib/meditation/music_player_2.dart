//import 'dart:html';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:google_fonts/google_fonts.dart';


//creates a separate music player for the non-guided meditation audio list
class MusicPlayer2 extends StatefulWidget {
  String title;
  String audioUrl;
  String cover;
  String artist;
  Function changeTrack2;
  final GlobalKey<MusicPlayerState2> key;
  MusicPlayer2({this.title, this.cover, this.audioUrl, this.artist, this.changeTrack2, this.key}) : super(key: key);
  MusicPlayerState2 createState() => MusicPlayerState2();
}

class MusicPlayerState2 extends State<MusicPlayer2>{
  double minValue = 0.0;  //beginning of the song
  double maxValue = 0.0;  //
  double currentValue = 0.0; //current part of the song that is being played
  String currentTime = '';
  String endTime = '';
  bool isPlaying = false;
  String currentSong = '';

  final AudioPlayer audioPlayer = AudioPlayer();

  void initState(){
    super.initState();
    setSong(widget.title, widget.artist, widget.audioUrl, widget.cover);
  }

  void dispose(){
    super.dispose();
    audioPlayer?.dispose();
  }

  void setSong(String title, String artist, String url, String cover) async{
    widget.title = title;
    widget.audioUrl = url;
    widget.cover = cover;
    widget.artist = artist;
    await audioPlayer.setUrl(widget.audioUrl);
    currentValue = minValue;
    maxValue = audioPlayer.duration.inMilliseconds.toDouble();
    setState(() {
      currentTime = getDuration(currentValue);
      endTime = getDuration(maxValue);
    });
    isPlaying = false;
    changeStatus();
    audioPlayer.positionStream.listen((duration) {
      currentValue = duration.inMilliseconds.toDouble();
      setState(() {
        currentTime = getDuration(currentValue);
      });
    });
  }

  void changeStatus() {
    setState(() {
      isPlaying = !isPlaying;
    });

    if(isPlaying){
      audioPlayer.play();
    } else {
      audioPlayer.pause();
    }
  }

  String getDuration(double value){
    Duration duration = Duration(milliseconds: value.round());
    return [duration.inMinutes, duration.inSeconds].map((element) => element.remainder(60).toString().padLeft(2, '0')).join(':');
  }



  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white,),
        ),
        title: Text(
            'Now Playing',
            style: TextStyle(color: Colors.white)
        ),
      ),
      body: Container(
          margin: EdgeInsets.fromLTRB(5, 40, 5, 0),
          child: Column(children: <Widget>[
            Expanded(
              child: Container(
                //height: 400.0,
                //width: 400.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: NetworkImage(widget.cover)
                    )
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.fromLTRB(0, 10, 0, 7),
              child: Text(
                widget.title,
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.fromLTRB(0, 0 , 0, 15),
              child: Text(
                widget.artist,
                style: GoogleFonts.raleway(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Slider(
              inactiveColor: Colors.black12,
              activeColor: Colors.white,
              min: minValue,
              max: maxValue,
              value: currentValue,
              onChanged: (value){
                currentValue = value;
                audioPlayer.seek(Duration(milliseconds: currentValue.round()));
              },
            ),
            Container(
              transform: Matrix4.translationValues(0, -5, 0),
              margin: EdgeInsets.fromLTRB(5, 0, 5, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      currentTime,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500
                      )
                  ),
                  Text(
                    endTime,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 55
                    ),
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      widget.changeTrack2(false);
                    },
                  ),
                  GestureDetector(
                    child: Icon(
                        isPlaying ? Icons.pause_circle_filled_rounded : Icons.play_circle_fill_rounded,
                        color: Colors.white,
                        size: 75
                    ),
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      changeStatus();
                    },
                  ),
                  GestureDetector(
                    child: Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 55
                    ),
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      widget.changeTrack2(true);
                    },
                  )
                ],
              ),
            ),
            SizedBox(
                height: 50
            ),
          ])
      ),
    );
  }
}