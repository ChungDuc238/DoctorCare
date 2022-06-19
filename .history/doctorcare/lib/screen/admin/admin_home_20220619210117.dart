import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorcare/screen/user/doctor_detail.dart';
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
        .where('trangthai', isEqualTo: false)
        .snapshots();
    return Scaffold(
        body: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
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
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(8),
                                child: Text(
                                  data.docs[index]['id'] ?? 'lỗi',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]);
                      });
                }),
          ],
        ));
  }
}
Widget _doctorItem(BuildContext context, String ten, String benhvien,
      String chuyenmon, String id) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DoctorDetails(
                      id: id,
                    )));
      },
      child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Image.asset(
                    'assets/logo/small_logo.png',
                    height: 80,
                    width: 80,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BS $ten',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        benhvien,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        chuyenmon,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                )
              ],
            ));
      }),
    );
  }
