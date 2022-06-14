import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepository {
  final FirebaseFirestore _firestore;

  FirestoreRepository() : _firestore = FirebaseFirestore.instance;
  getLichKham(String id) async {
   var docs = await _firestore.collection('lichkham').where('');
  }
}
