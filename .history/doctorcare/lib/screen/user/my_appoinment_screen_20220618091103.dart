
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAppoinmentScreen extends StatefulWidget {
  const MyAppoinmentScreen({super.key});

  @override
  State<MyAppoinmentScreen> createState() => _MyAppoinmentScreenState();
}

class _MyAppoinmentScreenState extends State<MyAppoinmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffEEEAFB),
        elevation: 0.0,
        foregroundColor: const Color(0xFF4702A2),
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.chevronLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Lịch khám của bạn',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.commentDots))
        ],
      ),
      body: SingleChildScrollView(child: Column(
        children: [
          
        ],
      )),
    );
  }
}