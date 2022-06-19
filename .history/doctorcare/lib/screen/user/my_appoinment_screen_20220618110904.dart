import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAppoinmentScreen extends StatefulWidget {
  const MyAppoinmentScreen({super.key});

  @override
  State<MyAppoinmentScreen> createState() => _MyAppoinmentScreenState();
}

class _MyAppoinmentScreenState extends State<MyAppoinmentScreen> {
  late Stream<QuerySnapshot> lichkham;
  final id = FirebaseAuth.instance.currentUser?.uid;
  @override
  void initState() {
    lichkham = FirebaseFirestore.instance
        .collection('datlich')
        .where('uidNguoiKham', isEqualTo: id)
        .snapshots();
    super.initState();
  }

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
        body: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
              stream: lichkham,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Lỗi khi lấy dữ liệu');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading');
                }
                final data = snapshot.requireData;

                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: data.size,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(\
                          child: Text(data.docs[index]['ngay'] ?? 'ko lấy được dữ liệu')),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(color: Colors.grey),
                          child: Column(
                            children: [
                              Text(data.docs[index]['tenPhongKham'] ??
                                  'ko lấy được dữ liệu'),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                );
              }),
        ));
  }
}
