import 'package:flutter/material.dart';

class ListWorkingScreen extends StatefulWidget {
  final String hoursWork;
  const ListWorkingScreen({super.key, required this.hoursWork});

  @override
  State<ListWorkingScreen> createState() => _ListWorkingScreenState();
}

class _ListWorkingScreenState extends State<ListWorkingScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: ((context, index) {
          return Text('');
        }));
  }
}
