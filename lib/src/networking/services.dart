import 'package:cloud_firestore/cloud_firestore.dart';

class Services {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<void> addMessage(String name, String message) async {
    await _firebaseFirestore.collection('messages').add({
      "name": name,
      "message": message,
    });
  }
}
