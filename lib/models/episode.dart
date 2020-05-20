import 'package:cloud_firestore/cloud_firestore.dart';

class Episode {
  final String imageUrl;
  final String name;
  final String tag;
  final String startTime;
  final String audioUrl;
  final DocumentReference reference;

  Episode({
    this.imageUrl,
    this.name,
    this.tag,
    this.startTime,
    this.reference,
    this.audioUrl
  });

  Episode.fromMap(Map<String, dynamic> map, {this.reference})
     : name = map['name'],
       imageUrl = map['imageUrl'],
       tag = map['tag'],
       audioUrl = map['audioUrl'],
       startTime = map['startTime'];

 Episode.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference);

 @override
 String toString() => "Record<$name>";
}