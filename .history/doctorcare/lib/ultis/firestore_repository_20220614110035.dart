import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepository {
  final FirebaseFirestore _firebaseAuth;

  AuthenticationRepository() : _firebaseAuth = FirebaseAuth.instance;
}
