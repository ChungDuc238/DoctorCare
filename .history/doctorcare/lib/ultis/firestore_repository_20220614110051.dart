import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepository {
  final FirebaseFirestore _firestore;

  AuthenticationRepository() : _firestore = FirebaseAuth.instance;
}
