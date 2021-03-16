import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String? content;
  String? todoId;
  Timestamp? dateCreated;
  bool? done;

  TodoModel(
    this.content,
    this.todoId,
    this.dateCreated,
    this.done,
  );

  TodoModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    todoId = documentSnapshot.id;

    var map = documentSnapshot.data();
    content = map!['content'];
    dateCreated = map["dateCreated"];
    done = map["done"];
  }
}
