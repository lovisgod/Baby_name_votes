import 'package:baby_names/screen/live_events.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:baby_names/models/Comment.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Psirius Radio',
     debugShowCheckedModeBanner: false,
     home: MyHomePage(),
   );
 }
}

class MyHomePage extends StatefulWidget {
 @override
 _MyHomePageState createState() {
   return _MyHomePageState();
 }
}

class _MyHomePageState extends State<MyHomePage> {
 @override
 Widget build(BuildContext context) {
   return Scaffold(
    //  appBar: AppBar(title: Text('Psirius Radio')),
     body: StreamBuilder<QuerySnapshot>(
         stream: Firestore.instance.collection('programs').snapshots(),
         builder: (context, snapshot) {
         if (!snapshot.hasData) return LinearProgressIndicator();
         return _buildBody(context, snapshot.data.documents);
       },
    ),
   );
 }

 Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshots) {
   return Scaffold(
     body: SafeArea(
       child: ListView(
         padding: EdgeInsets.symmetric(vertical: 30.0),
         children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'We bring Light into your dark side....',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
             SizedBox(height: 20.0),
            LiveCarousel(snapshots),
            SizedBox(height: 20.0),
            // HotelCarousel(),
         ],
       ),
     ),
   );
 }
}
