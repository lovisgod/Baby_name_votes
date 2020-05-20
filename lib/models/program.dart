import 'package:baby_names/models/episode.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Program {
 String id; 
 final String name;
 final String time;
 final String details;
 final String anchor;
 final String imageUrl;
 final String audioUrl;
 bool episodes;
 DocumentReference reference;


   Program({
    this.imageUrl,
    this.name,
    this.time,
    this.details,
    this.anchor,
    this.audioUrl
  });

 Program.fromMap(Map<String, dynamic> map, {this.reference})
      
     : episodes = map['episodes'],
       id = map['_id'],
       name = map['name'],
       time = map['time'],
       details =map['details'],
       imageUrl = map['imageUrl'],
       anchor = map['anchor'],
       audioUrl = map['audioUrl'];

 Program.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference);

 @override
 String toString() => "Record<$name>";
}

