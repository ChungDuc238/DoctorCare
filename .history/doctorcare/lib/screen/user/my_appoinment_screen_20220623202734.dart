// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorcare/screen/user/detail_lichkham.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widget/user/bottomNavigationBar.dart';

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
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.0, color: const Color(0xffE2E2E0)),
                    ),
                    margin: const EdgeInsets.only(bottom: 16, top: 16),
                    height: 90.0,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailLichKham(
                                      idLichKham: data.docs[index]
                                          ['idDatLichKham'])));
                          print(data.docs[index]['idDatLichKham']);
                        },
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                data.docs[index]['ngay'] ?? '',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin: const EdgeInsets.only(left: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      data.docs[index]['tenPhongKham'],
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      data.docs[index]['thoigian'],
                                      style: const TextStyle(
                                          color: Color(0xFF838391),
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
      ),
      bottomNavigationBar: const BottomNavigationBarCustom(currentIndex: 1),
    );
  }
}
