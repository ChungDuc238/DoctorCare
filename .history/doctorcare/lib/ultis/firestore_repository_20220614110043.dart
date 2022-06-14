import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepository {
  final FirebaseFirestore _fire;

  AuthenticationRepository() : _firebaseAuth = FirebaseAuth.instance;
}
