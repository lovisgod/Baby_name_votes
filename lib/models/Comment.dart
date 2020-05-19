import 'package:cloud_firestore/cloud_firestore.dart';


class Record {
 final String programName;
 final String message;
 final String senderName;
 final DocumentReference reference;

 Record.fromMap(Map<String, dynamic> map, {this.reference})
     : programName = map['programName'],
       senderName = map['senderName'],
       message = map['message'] ;

 Record.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference);

 @override
 String toString() => "Record<$message>";
}