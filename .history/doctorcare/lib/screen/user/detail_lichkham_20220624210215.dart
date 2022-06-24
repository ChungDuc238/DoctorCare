import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorcare/model/datlich_model.dart';
import 'package:doctorcare/screen/user/my_appoinment_screen.dart';
import 'package:flutter/material.dart';

import '../../ultis/firestore_repository.dart';
import '../../widget/user/bottomNavigationBar.dart';

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

  late String time;
  late String date;
  late String tenPK;
  String trangthai = 'true';
  String idLK = '';
  String timeCurrent = '';
  String idLKUpdate = '';
  List<int> selectedIndexList = <int>[];
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  @override
  void initState() {
    firestore = FirestoreRepository();
    time = '';
    date = '';
    tenPK = '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView(
        children: <Widget>[
          
        ],
      ),
    ));
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
