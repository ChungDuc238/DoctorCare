import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DoctorInfo extends StatefulWidget {
  String id;
  const DoctorInfo({super.key, required this.id});

  @override
  State<DoctorInfo> createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(''),
    );
  }
}
