import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth;

  AuthenticationRepository() : _firebaseAuth = FirebaseAuth.instance;

  Future<bool> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // user = result.user!;
    } catch (e) {
      return false;
    }

    return true;
  }

  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (e) {
    }
  }

  // static createUser(UserModel user) async {
  //   final docUser =
  //       FirebaseFirestore.instance.collection('users').doc(user.uid);
  //   await docUser.set(user.toJson());
  //   return user.uid;
  // }

  putUidToFireStore() async {
    // ignore: await_only_futures
    var uid = await _firebaseAuth.currentUser?.uid;
    FirebaseFirestore.instance.collection('user').add({'id': uid});
    // FirebaseFirestore.instance.collection(collectionPath)
  }
}
