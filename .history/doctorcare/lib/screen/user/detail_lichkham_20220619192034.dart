// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorcare/model/datlich_model.dart';
import 'package:doctorcare/screen/user/my_appoinment_screen.dart';
import 'package:flutter/material.dart';

import '../../ultis/firestore_repository.dart';

class DetailLichKham extends StatefulWidget {
  final String idLichKham;
  const DetailLichKham({super.key, required this.idLichKham});

  @override
  State<DetailLichKham> createState() => _DetailLichKhamState();
}

class _DetailLichKhamState extends State<DetailLichKham>
    with SingleTickerProviderStateMixin {
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
  String timeCurrent = '';
  List<int> selectedIndexList = <int>[];
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  @override
  void initState() {
    firestore = FirestoreRepository();
    nameBS = '';
    idBS = '';
    uid = '';
    time = '';
    date = '';
    tenPK = '';
    nameNK = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 50.0,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                  size: 22.0,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 25.0),
                                child: Text('Th??ng tin l???ch kh??m',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        fontFamily: 'sans-serif-light',
                                        color: Colors.black)),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                FutureBuilder<DatLichModel>(
                    future: getDetailDatLich(widget.idLichKham),
                    builder: (context, snapshot) {
                      print(snapshot.data?.tenBS);
                      print(snapshot.data?.tenBS);
                      timeCurrent = snapshot.data?.thoigian ?? '';
                      return Container(
                        color: const Color(0xffFFFFFF),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 25.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              'Th??ng tin l???ch kh??m',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            _status
                                                ? _getEditIcon()
                                                : Container(),
                                          ],
                                        )
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              'T??n',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Flexible(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: '${snapshot.data?.ten}',
                                            ),
                                            enabled: false,
                                            autofocus: !_status,
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          // children: const <Widget>[
                                          //   Text(
                                          //     'Email ID',
                                          //     style: TextStyle(
                                          //         fontSize: 16.0,
                                          //         fontWeight: FontWeight.bold),
                                          //   ),
                                          // ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              'T??n ph??ng kh??m',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Flexible(
                                          child: TextField(
                                            decoration: InputDecoration(
                                                hintText: snapshot
                                                        .data?.tenPhongKham ??
                                                    ''),
                                            enabled: !_status,
                                          ),
                                        ),
                                      ],
                                    )),
                                !_status
                                    ? _updateLichKham(
                                        snapshot.data?.uidBacSi ?? '')
                                    : Container(),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              'Th???i gian',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Flexible(
                                          child: TextField(
                                            decoration: InputDecoration(
                                                hintText:
                                                    snapshot.data?.thoigian ??
                                                        ''),
                                            enabled: !_status,
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            child: const Text(
                                              'T??n b??c s??',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            child: const Text(
                                              'Ng??y',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Flexible(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  hintText:
                                                      snapshot.data?.tenBS ??
                                                          ''),
                                              enabled: false,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                hintText:
                                                    snapshot.data?.ngay ?? ''),
                                            enabled: !_status,
                                          ),
                                        ),
                                      ],
                                    )),
                                !_status ? _getActionButtons() : Container(),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: const Text(
                                                    'B???n c?? mu???n h???y l???ch kh??m n??y?'),
                                                content: Text(''),
                                                actions: [
                                                  // h???y h??nh ?????ng
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('h???y '),
                                                  ),
                                                  //x??c nh???n h???y l???ch kh??m
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary:
                                                                Colors.white),
                                                    onPressed: () async {
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection('datlich')
                                                          .doc(
                                                              widget.idLichKham)
                                                          .delete();
                                                      final idLichKham =
                                                          snapshot
                                                              .data?.idLichKham;
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                              'lichkham')
                                                          .doc(idLichKham)
                                                          .update({
                                                        'thoigian.${snapshot.data?.thoigian}':
                                                            'true'
                                                      });
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const MyAppoinmentScreen()));
                                                    },
                                                    child: const Text(
                                                      'x??c nh???n',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                ],
                                              ));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 40),
                                      width: 100,
                                      child: const Text(
                                        'X??a',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
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
                  return const Text('L???i khi l???y d??? li???u');
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
                                  'Hi???n t???i ch??a c?? l???ch kh??m',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            data.docs[index]['tenphongkham'] ?? '',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),

                          /// l???ch l??m vi???c theo ng??y
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
                                              '???? c?? ng?????i ?????t',
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
                                              print(time);
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
                                          //n???u ???? c?? ng?????i ?????t
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

  Widget _getActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            // ignore: sort_child_properties_last
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                  child: ElevatedButton(
                child: const Text("L??u"),
                onPressed: () {
                  setState(() async {
                    final DocumentReference reference = FirebaseFirestore
                        .instance
                        .collection('datlich')
                        .doc(widget.idLichKham);
                    print(widget.idLichKham);
                    await reference.update({'thoigian': time});
                    final DocumentReference referenceLichKham =
                        FirebaseFirestore.instance
                            .collection('lichkham')
                            .doc(idLK);

                    await referenceLichKham.update({'thoigian.$time': 'false'});
                    await referenceLichKham
                        .update({'thoigian.$timeCurrent': 'true'});
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              )),
            ),
            flex: 2,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                  child: ElevatedButton(
                child: const Text("H???y"),
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: const CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}

Future<DatLichModel> getDetailDatLich(String id) async {
  final data =
      await FirebaseFirestore.instance.collection('datlich').doc(id).get();
  final DatLichModel datlich;
  datlich = DatLichModel.fromMap(data.data()!);

  return datlich;
}

// Stream<List<DatLichModel>> getDatLich(String uid) {
//   return FirebaseFirestore.instance.collection('datlich').snapshots().map(
//       (querySnap) => querySnap.docs
//           .map((document) => DatLichModel.fromMap(document.data()))
//           .toList());
// }
