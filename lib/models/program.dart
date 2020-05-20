import 'package:baby_names/models/episode.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Program {
 final String name;
 final String time;
 final String details;
 final String anchor;
 final String imageUrl;
 final String audioUrl;
 final List<Episode> episodes;
 final DocumentReference reference;

 Program.fromMap(Map<String, dynamic> map, {this.reference})
     : name = map['name'],
       time = map['time'],
       details =map['details'],
       imageUrl = map['imageUrl'],
       episodes = map['episodes'],
       anchor = map['anchor'],
       audioUrl = map['audioUrl'];

 Program.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference);

 @override
 String toString() => "Record<$name>";
}

