// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorcare/model/doctor_model.dart';
import 'package:doctorcare/ultis/firestore_repository.dart';
import 'package:doctorcare/widget/base/BtnPrimary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key, required this.id});
  final String id;
  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  late FirestoreRepository firestore;
  int isSelected = -1;
  late String nameBS;
  late String idBS;
  late String uid;
  late String time;
  late String date;
  late String tenPK;
  late String nameNK;
  String trangthai = 'true';
  String idLK = '';
  List<int> selectedIndexList = <int>[];
  @override
  void initState() {
    super.initState();
    firestore = FirestoreRepository();
    nameBS = '';
    idBS = '';
    uid = '';
    time = '';
    date = '';
    tenPK = '';
    nameNK = '';
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> lichkham = FirebaseFirestore.instance
        .collection('lichkham')
        .where('idBS', isEqualTo: widget.id)
        .snapshots();
    nameNK = FirebaseAuth.instance.currentUser?.displayName ?? nameNK;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffEEEAFB),
        elevation: 0.0,
        foregroundColor: const Color(0xFF4702A2),
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.chevronLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Thông tin bác sĩ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.commentDots))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              FutureBuilder<Doctor>(
                  future: getBS(widget.id),
                  builder: (context, snapshot) {
                    nameBS = snapshot.data?.ten ?? '';

                    uid = FirebaseAuth.instance.currentUser?.uid ?? '';

                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LayoutBuilder(
                              builder: (context, BoxConstraints constraints) {
                            return SizedBox(
                              width: constraints.maxWidth,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(100)),
                                    child: Image.network(
                                      snapshot.data?.avatar ??
                                          'https://png.pngtree.com/element_our/20190528/ourlarge/pngtree-handsome-doctor-image_1140314.jpg',
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            (constraints.maxWidth - 100) * 0.9,
                                        child: Text(
                                          snapshot.data?.ten ?? '',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        snapshot.data?.chuyenmon ?? '',
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                        width:
                                            (constraints.maxWidth - 100) * 0.9,
                                        child: Text(
                                          snapshot.data?.benhvien ?? '',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                          const SizedBox(
                            height: 24,
                          ),
                          // statistic(),
                          const SizedBox(
                            height: 36,
                          ),
                          Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Thông tin thêm',
                                      style: TextStyle(
                                          color: Color(0xff4702A2),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    snapshot.data?.mota ?? '',
                                    style: const TextStyle(fontSize: 18),
                                  )
                                ]),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          // AppointmentList(context),
                          const SizedBox(
                            height: 4,
                          ),
                          // workingTimeWidget(context),
                        ]);
                  }),
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
                                  data.docs[index]['ngay'] ??
                                      'Hiện tại chưa có lịch khám',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                data.docs[index]['tenphongkham'] ?? '',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),

                              /// lịch làm việc theo ngày
                              GridView.builder(
                                shrinkWrap: true,
                                itemCount: data.docs[index]['thoigian'].length,
                                itemBuilder: ((context, i) {
                                  return InkWell(
                                    child: InkWell(
                                        onTap: () {
                                          if (!selectedIndexList.contains(i)) {
                                            selectedIndexList.add(i);
                                          } else {
                                            selectedIndexList.remove(i);
                                          }

                                          setState(() {
                                            isSelected = index;

                                            time = data.docs[index]['thoigian']
                                                    .keys
                                                    .elementAt(i) ??
                                                '';
                                            trangthai = data.docs[index]
                                                ['thoigian'][time];
                                            idLK =
                                                data.docs[index]['idLK'];
                                            log(idLK);
                                            //xem trạng thái của lịch khám (đã có người đặt hay chưa)
                                            log(trangthai);
                                            log(time);
                                            tenPK = data.docs[index]
                                                    ['tenphongkham'] ??
                                                'Hiện tại chưa có lịch khám';
                                            date = data.docs[index]['ngay'] ??
                                                'Hiện tại chưa có lịch khám';
                                          });
                                        },
                                        child: trangthai.compareTo('true') == 0
                                            // nếu chưa có người đặt
                                            ? Container(
                                                margin: const EdgeInsets.only(
                                                    left: 20, top: 10),
                                                decoration: BoxDecoration(
                                                  color: selectedIndexList
                                                              .contains(i) &&
                                                          isSelected == index
                                                      ? const Color(0xff107163)
                                                      : const Color(0xffEEEEEE),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 2),
                                                      child: Icon(
                                                        Icons.access_time,
                                                        color: selectedIndexList
                                                                    .contains(
                                                                        i) &&
                                                                isSelected ==
                                                                    index
                                                            ? Colors.white
                                                            : Colors.black,
                                                        size: 18,
                                                      ),
                                                    ),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 2),
                                                      child: Text(
                                                        data
                                                                .docs[index]
                                                                    ['thoigian']
                                                                .keys
                                                                .elementAt(i) ??
                                                            '',
                                                        style: TextStyle(
                                                          color: selectedIndexList
                                                                      .contains(
                                                                          i) &&
                                                                  isSelected ==
                                                                      index
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontSize: 17,
                                                          fontFamily: 'Roboto',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            //nếu đã có người đặt
                                            : Container(
                                                child: Text('đã có người chọn'),
                                              )),
                                  );
                                }),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 3,
                                ),
                              ),
                            ],
                          );
                        });
                  }),
              const SizedBox(height: 16),
              BtnPrimary(
                  title: 'Đặt lịch',
                  cb_press: () async {
                    // final DocumentReference reference =
                    //     FirebaseFirestore.instance.collection('datlich').doc();
                    // trangthai = 'false';

                    // try {
                    //   await reference.set({
                    //     'uidBacSi': widget.id,
                    //     'tenBS': nameBS,
                    //     'uidNguoiKham': uid,
                    //     'tenPhongKham': tenPK,
                    //     'ngay': date,
                    //     'thoigian': time,
                    //     'idLichKham': reference.id,
                    //     'ten': nameNK,
                    //     'trangthai': trangthai,
                    //   });
                    try {
                      final DocumentReference reference = FirebaseFirestore
                          .instance
                          .collection('datlich')
                          .doc(idLK);
                        reference.update()
                      const snackBar = SnackBar(
                        content: Text('Đặt lịch thành công'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } catch (e) {
                      const snackBar = SnackBar(
                        content: Text('Đặt lịch thất bại'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    // print(nameBS);
                    // print(tenPK);
                    // print(date);
                    // print(time);
                    // print(widget.id);
                    // print(uid);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

Future<Doctor> getBS(String id) async {
  final data =
      await FirebaseFirestore.instance.collection('BacSi').doc(id).get();
  final Doctor doctor;
  doctor = Doctor.fromMap(data.data()!);

  return doctor;
}
