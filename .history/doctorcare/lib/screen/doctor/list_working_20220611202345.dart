import 'package:flutter/material.dart';

class ListWorkingScreen extends StatefulWidget {
  final List list;
  const ListWorkingScreen({super.key, required this.list});

  @override
  State<ListWorkingScreen> createState() => _ListWorkingScreenState();
}

class _ListWorkingScreenState extends State<ListWorkingScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: ((context, index) {
          return Text('${widget}');
        }));
  }
}
