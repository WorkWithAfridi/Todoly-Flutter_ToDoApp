import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  late String title;
  late String description;
  late DateTime eventDate;
  late String status;

  TaskModel.name({
    required this.title,
    required this.description,
    required this.eventDate,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'eventDate': eventDate,
        'status': status
      };

  static TaskModel fromSnap(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return TaskModel.name(
      status: snapshot['status'],
      title: snapshot['title'],
      description: snapshot['description'],
      eventDate: snapshot['eventDate'],
    );
  }
}
