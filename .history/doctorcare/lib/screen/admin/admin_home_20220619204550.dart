
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> lichkham = FirebaseFirestore.instance
        .collection('BacSi')
        .where('trangthai', isEqualTo: widget.id)
        .snapshots();
    return Scaffold(

    );
  }
}