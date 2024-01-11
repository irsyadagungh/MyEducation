import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String username, String password) async {
    await usersCollection.add({
      'username': username,
      'password': password,
      // Add other fields as needed
    });
  }
}
