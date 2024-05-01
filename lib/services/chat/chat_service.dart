import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  // get instance of FireStore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get user stream
  Stream<List<Map<String, dynamic>>> getUsers() {
    return _firestore
        .collection('users')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final user = doc.data();
              return user;
            }).toList());
  }
}
