// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DoctorInfo extends StatefulWidget {
  final String id;
  const DoctorInfo({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DoctorInfo> createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(widget.id, style: T,),
    );
  }
}
