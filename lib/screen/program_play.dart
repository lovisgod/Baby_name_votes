import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:baby_names/models/episode.dart';
import 'package:baby_names/models/program.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Programplay extends StatefulWidget {
  final Program program;

  Programplay({this.program});

  @override
  _ProgramplayScreenState createState() => _ProgramplayScreenState();
}

class _ProgramplayScreenState extends State<Programplay> {

  IconData play = Icons.play_circle_filled;
  bool playing = false;
  AudioPlayer player;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     player = AudioPlayer();
    //  player.setUrl(widget.program.audioUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.program.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.network(
                      widget.program.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    widget.program.name,
                    style: TextStyle(
                         color: Colors.black,
                        fontSize: 20.0,
                    ),
                  ),
                  Text(
                    widget.program.anchor,
                    style: TextStyle(
                         color: Colors.black,
                        fontSize: 10.0,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  GestureDetector(
                    onTap: (){
                      debugPrint('comment clicked');
                     },
                      child: Container(
                      width: 300.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: Alignment.center,
                      child: Text('comment will be here',
                       style: TextStyle(
                         color: Colors.white60,
                         fontSize: 20.0
                       ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {   
                          setState(() {
                          
                            if ( this.playing == false) {
                              this.playing = true;
                              this.play = Icons.pause_circle_filled;
                             
                              player.play(widget.program.audioUrl);
                              player.setNotification(title: widget.program.name,
                               imageUrl: widget.program.imageUrl);
                            } else {
                              this.playing = false;
                              this.play = Icons.play_circle_filled;
                              player.pause();
                            }
                          }); 
                      },
                        child: Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(30.0),
                        ),
                      child: Icon(
                       play,
                       size: 20.0,
                      color: Colors.white,
                    ),
                   ),
                    ),
                     GestureDetector(
                        onTap: () {    
                          player.stop();
                          setState(() {
                            this.playing = false;
                            this.play = Icons.play_circle_filled;
                          });
                      },
                        child: Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(30.0),
                        ),
                      child: Icon(
                       Icons.stop,
                       size: 20.0,
                      color: Colors.white
                    ),
                   ),
                    ),
                  ],
                  )
                ],
              ),
            )
          ),
        ],

      ),
    );
  }
}