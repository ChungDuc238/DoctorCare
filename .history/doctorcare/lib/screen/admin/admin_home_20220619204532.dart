
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
        .collection('lichkham')
        .where('idBS', isEqualTo: widget.id)
        .snapshots();
    return Scaffold(

    );
  }
}