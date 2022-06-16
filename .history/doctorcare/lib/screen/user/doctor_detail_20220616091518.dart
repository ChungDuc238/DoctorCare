import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorcare/model/doctor_model.dart';
import 'package:doctorcare/screen/user/widget/custom_working_time.dart';
import 'package:doctorcare/ultis/firestore_repository.dart';
import 'package:doctorcare/widget/base/BtnPrimary.dart';
import 'package:doctorcare/widget/user/bottomNavigationBar.dart';
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
  late String name;
  late String time;
  late String date;
  late String tenPK;
  @override
  void initState() {
    super.initState();
    firestore = FirestoreRepository();
    nameBS = '';
    idBS = '';
    name = '';
    time = '';
    date = '';
    tenPK = '';
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> lichkham = FirebaseFirestore.instance
        .collection('lichkham')
        .where('id', isEqualTo: widget.id)
        .snapshots();
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
          // decoration: BoxDecoration(
          //   color: Colors.white,
          //   borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(32),
          //     topRight: Radius.circular(32),
          //   ),
          // ),
          child: Column(
            children: [
              FutureBuilder<Doctor>(
                  future: getBS(widget.id),
                  builder: (context, snapshot) {
                    nameBS = snapshot.data?.ten ?? '';
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
                           tenPK = data.docs[index]['ngay'] ??
                        'Hiện tại chưa có lịch khám';
                          // length: data.docs[index]['thoigian'].length,
                          //   date: data.docs[index]['ngay'],
                          //   time: data.docs[index]['thoigian'],
                          //   phongkham: data.docs[index]['tenphongkham'],
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
                                        setState(() {
                                          isSelected = i;
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 10),
                                        decoration: BoxDecoration(
                                          color: isSelected == i
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
                                                color: isSelected == i
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
                                                        [i] ??
                                                    '',
                                                style: TextStyle(
                                                  color: isSelected == i
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 17,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                ),
                              ),
                            ],
                          );
                        });
                  }),
              const SizedBox(height: 16),
              BtnPrimary(
                  title: 'Đặt lịch',
                  cb_press: () {
                    print(nameBS);
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
