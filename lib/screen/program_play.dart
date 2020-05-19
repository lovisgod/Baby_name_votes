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
                    child: Image(
                      image: AssetImage(widget.program.imageUrl),
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
                    widget.program.anchor,
                    style: TextStyle(
                         color: Colors.white70,
                        fontSize: 20.0,
                    ),
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