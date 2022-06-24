import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LichKhamBS extends StatefulWidget {
  const LichKhamBS({super.key});

  @override
  State<LichKhamBS> createState() => _LichKhamBSState();
}

class _LichKhamBSState extends State<LichKhamBS> {
  int isSelected = -1;

  late String time;
  late String date;
  late String tenPK;
  String trangthai = 'true';
  String idLK = '';
  String timeCurrent = '';
  String idLKUpdate = '';
  List<int> selectedIndexList = <int>[];
  @override
  Widget build(BuildContext context) {
    final id = FirebaseAuth.instance.currentUser?.uid;
    return Scaffold(body: _updateLichKham(id??''));
  }
  Widget _updateLichKham(String idBS) {
    final Stream<QuerySnapshot> lichkham = FirebaseFirestore.instance
        .collection('lichkham')
        .where('idBS', isEqualTo: idBS)
        .snapshots();
    // nameNK = FirebaseAuth.instance.currentUser?.displayName ?? nameNK;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
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
                              data.docs[index]['ngay'] ??
                                  'Hiện tại chưa có lịch khám',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
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
                              var key = data.docs[index]['thoigian'].keys
                                  .elementAt(i);
                              trangthai = data.docs[index]['thoigian'][key];
                              return trangthai.compareTo('false') == 0
                                  ? Container(
                                      margin: const EdgeInsets.only(
                                          left: 20, top: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.red),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 2),
                                            child: Text(
                                              data.docs[index]['thoigian'].keys
                                                      .elementAt(i) ??
                                                  '',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontFamily: 'Roboto',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(right: 2),
                                            child: const Text(
                                              'Đã có người đặt',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : InkWell(
                                      child: InkWell(
                                          onTap: () {
                                            if (!selectedIndexList
                                                .contains(i)) {
                                              selectedIndexList.add(i);
                                            } else {
                                              selectedIndexList.remove(i);
                                            }

                                            setState(() {
                                              isSelected = index;
                                              time = data
                                                      .docs[index]['thoigian']
                                                      .keys
                                                      .elementAt(i) ??
                                                  '';
                                              tenPK = data.docs[index]
                                                      ['tenphongkham'] ??
                                                  'Hiện tại chưa có lịch khám';
                                              date = data.docs[index]['ngay'] ??
                                                  'Hiện tại chưa có lịch khám';
                                              print(time);
                                              idLKUpdate =
                                                  data.docs[index]['idLK'];
                                            });
                                          },
                                          child: Container(
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
                                                  margin: const EdgeInsets.only(
                                                      right: 2),
                                                  child: Icon(
                                                    Icons.access_time,
                                                    color: selectedIndexList
                                                                .contains(i) &&
                                                            isSelected == index
                                                        ? Colors.white
                                                        : Colors.black,
                                                    size: 18,
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 2),
                                                  child: Text(
                                                    data.docs[index]['thoigian']
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
                                          ),
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
        ],
      ),
    );
  }
}
