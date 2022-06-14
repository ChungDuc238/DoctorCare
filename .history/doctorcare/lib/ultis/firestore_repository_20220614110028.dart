class FirestoreRepository {
  final FirebaseAuth _firebaseAuth;

  AuthenticationRepository() : _firebaseAuth = FirebaseAuth.instance;
}
