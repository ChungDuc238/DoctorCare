
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LichKhamBS extends StatefulWidget {
  const LichKhamBS({super.key});

  @override
  State<LichKhamBS> createState() => _LichKhamBSState();
}

class _LichKhamBSState extends State<LichKhamBS> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> lichkham = FirebaseFirestore.instance
        .collection('lichkham')
        .where('idBS', isEqualTo: widget.id)
        .snapshots();
    return Container();
  }
}