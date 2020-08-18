
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String currentTime = "00:00";
  String completeTime= "00:00";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _audioPlayer.onAudioPositionChanged.listen((Duration duration){
      setState(() {
        currentTime = duration.toString().split(".")[0];
      });
    });

    _audioPlayer.onDurationChanged.listen((Duration duration){
      setState(() {
        completeTime = duration.toString().split(".")[0];
      });
    });

  }

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            color: Colors.blueGrey,

            child:Card(
              color: Colors.white,
              margin: EdgeInsets.all(40),
              elevation: 50,
              shadowColor: Colors.black,

              child:Container(
                color: Colors.black,
                height:310,
                width:310,
                child:Image.asset("assets/note.jpg",),
              ),  
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width*0.7,
            height: 70,

            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.55, left: MediaQuery.of(context).size.width*0.15),

            decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.circular(30),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                
                IconButton(
                  icon: Icon(isPlaying ? Icons.pause_circle_outline : Icons.play_circle_outline, size: 40,),
                  onPressed: (){
                    if(isPlaying){
                      _audioPlayer.pause();
                      
                      setState(() {
                        isPlaying = false;
                        Text("playing..");
                      });
                    }else{
                      _audioPlayer.resume();

                      setState(() {
                        isPlaying = true;
                      });
                    }

                  },
                ),

                SizedBox(width: 14,),

                IconButton(
                  icon: Icon(Icons.stop, size: 40,),
                  onPressed: (){
                    _audioPlayer.stop();

                    setState(() {
                      isPlaying = false;
                    });

                  },
                ),
                

                Text(currentTime, style: TextStyle(fontWeight: FontWeight.w800),),

                Text(" | "),

                Text(completeTime, style: TextStyle(fontWeight: FontWeight.w800),),

              ],
              
            ),
            
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.audiotrack,),

        onPressed: () async{
          String filePath = await FilePicker.getFilePath();

          int status = await _audioPlayer.play(filePath, isLocal: true);
          
          if(status == 1){
            setState(() {
              isPlaying = true;
            });
          }
        },
        
      ),
      
    );
  }
  
}