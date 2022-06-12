import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorcare/model/doctor_model.dart';
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
  late Doctor data;
  @override
  void initState() {
    super.initState();

    data = getDoctor(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    void geUs() async {
      final doctor = await getDoctor(widget.id);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffEEEAFB),
        elevation: 0.0,
        foregroundColor: const Color(0xFF4702A2),
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.chevronLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Details Doctor',
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            LayoutBuilder(builder: (context, BoxConstraints constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      child: Image.network(
                        data.avatar ??
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: (constraints.maxWidth - 100) * 0.9,
                          child: const Text(
                            'bác sĩ trang',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w900),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          ('test'),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: (constraints.maxWidth - 100) * 0.9,
                          child: Text(
                            'bệnh viện',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
            SizedBox(
              height: 24,
            ),
            // statistic(),
            SizedBox(
              height: 36,
            ),
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('About',
                        style: TextStyle(
                            color: Color(0xff4702A2),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'mô tả',
                    )
                  ]),
            ),
            SizedBox(
              height: 24,
            ),
            // AppointmentList(context),
            SizedBox(
              height: 4,
            ),
            // workingTimeWidget(context),
          ]),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarCustom(
        currentIndex: 1,
      ),
    );
  }
}

getDoctor(String id) async {
  final doctor = await getBS(id);
}

Future<Doctor> getBS(String id) async {
  final data =
      await FirebaseFirestore.instance.collection('BacSi').doc(id).get();
  final Doctor doctor;
  doctor = Doctor.fromMap(data.data()!);

  return doctor;
}
