// ignore: depend_on_referenced_packages
// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
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

  Future<bool> checkRole(String? id) async {
    try {
      final Stream<QuerySnapshot> result = await FirebaseFirestore.instance
          .collection('NguoiKhamBenh')
          .where('id', isEqualTo: id)
          .snapshots();
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return false;
    }
    return true;
  }

  putEmailToFireStore(String role, String password, String ten) async {
    // ignore: await_only_futures
    var email = await _firebaseAuth.currentUser?.email;
    var id = await _firebaseAuth.currentUser?.uid;

    await FirebaseFirestore.instance
        .collection('taikhoan')
        .doc('$id')
        .set({'email': email, 'role': role, 'password': password, 'id': id})
        .then((_) => print('Added'))
        .catchError((error) => print('Add failed: $error'));
    await FirebaseAuth.instance.currentUser?.updateDisplayName(ten);
    if (role.compareTo('doctor') == 0) {
      await FirebaseFirestore.instance
          .collection('BacSi')
          .doc('$id')
          .set({
            'email': email,
            'id': id,
            'ten': ten,
            'chuyenmon': '',
            'anhDaiDien': '',
            
          })
          .then((_) => print('Added'))
          .catchError((error) => print('Add failed: $error'));
    }
    if (role.compareTo('user') == 0) {
      await FirebaseFirestore.instance
          .collection('NguoiKhamBenh')
          .doc('$id')
          .set({'email': email, 'id': id, 'ten': ten});
    }

    // FirebaseFirestore.instance.collection(collectionPath)
  }
}
