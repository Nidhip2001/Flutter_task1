import 'package:flutter/material.dart';
import 'package:music_app/localaudio/audio.dart';
import 'package:video_player/video_player.dart';
import 'package:music_app/localaudio/video.dart';

void main()  => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text( 'MY AUDIO-VIDEO APP',
              style: TextStyle(
                fontSize: 30,
                color: Colors.blueGrey[800],             
              ),
            ),   
            backgroundColor: Colors.yellow[300],      
            bottom: TabBar(
              //   isScrollable: true,
              labelColor: Colors.black87,
              tabs: [
                Tab(
                  icon: Icon(Icons.music_note,
                  color: Colors.blueGrey[800],),
                  text: "Audio",  
                ),
                //Tab(icon: Icon(Icons.music_note), text: "AudioIn"),
                Tab(
                  icon: Icon(Icons.video_library, 
                  color: Colors.blueGrey[700],), 
                  text: "Video"),
                //Tab(icon: Icon(Icons.video_library), text: "VideoIn"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
                
              HomePage(),   
              ChewieListItem(
                videoPlayerController: VideoPlayerController.asset(
                  'assets/video/le_dooba.mp4',
                  ),
                
                looping: true,
              ),
             
            ],         
          ),
        ),
      ),
    );
  }

}
