import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepository {
  final FirebaseFirestore _firestore;

  FirestoreRepository() : _firestore = FirebaseFirestore.instance;
}
