import 'package:doctorcare/screen/user/doctor_detail.dart';
import 'package:doctorcare/widget/base/BtnPrimary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../model/doctor_model.dart';

class InfoDoctorScreen extends StatefulWidget {
  final String id;
  const InfoDoctorScreen({super.key, required this.id});

  @override
  State<InfoDoctorScreen> createState() => _InfoDoctorScreenState();
}

class _InfoDoctorScreenState extends State<InfoDoctorScreen> {
  String uid = '';
  String nameBS = '';
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
          child: Column(children: [
            FutureBuilder<Doctor>(
              future: getBS(widget.id),
              builder: (context, snapshot) {
                nameBS = snapshot.data?.ten ?? '';

                uid = FirebaseAuth.instance.currentUser?.uid ?? '';

                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // LayoutBuilder(
                      //     builder: (context, BoxConstraints constraints) {
                      //   return SizedBox(
                      //     width: constraints.maxWidth,
                      //     child: Row(
                      //       children: [
                      //         ClipRRect(
                      //           borderRadius: const BorderRadius.all(
                      //               Radius.circular(100)),
                      //           child: Image.network(
                      //             snapshot.data?.avatar ??
                      //                 'https://png.pngtree.com/element_our/20190528/ourlarge/pngtree-handsome-doctor-image_1140314.jpg',
                      //             height: 80,
                      //             width: 80,
                      //           ),
                      //         ),
                      //         const SizedBox(
                      //           width: 16,
                      //         ),
                      //         Column(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           mainAxisSize: MainAxisSize.min,
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             SizedBox(
                      //               width: (constraints.maxWidth - 100) * 0.9,
                      //               child: Text(
                      //                 snapshot.data?.ten ?? '',
                      //                 style: const TextStyle(
                      //                     fontSize: 16,
                      //                     fontWeight: FontWeight.w900),
                      //               ),
                      //             ),
                      //             const SizedBox(
                      //               height: 4,
                      //             ),
                      //             Text(
                      //               snapshot.data?.chuyenmon ?? '',
                      //             ),
                      //             const SizedBox(
                      //               height: 4,
                      //             ),
                      //             Container(
                      //               width: (constraints.maxWidth - 100) * 0.9,
                      //               child: Text(
                      //                 snapshot.data?.benhvien ?? '',
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   );
                      // }),

                      Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Ảnh đại diện',
                                style: TextStyle(fontSize: 21),
                              ),
                              SizedBox(
                                child: snapshot.data?.avatar == null
                                    ? const Text('Chưa có ảnh đại diện',
                                        style: TextStyle(fontSize: 21))
                                    : Image.network(
                                        snapshot.data?.avatar ?? ''),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Colors.grey,
                                child: Row(
                                  children: [
                                    const Text('Họ tên:',
                                        style: TextStyle(fontSize: 21)),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(snapshot.data?.ten ?? 'Chưa nhập tên',
                                        style: const TextStyle(fontSize: 21)),
                                  ],
                                ),
                              ),
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
              },
            ),
            Row(
              children: [
                Expanded(
                  child: BtnPrimary(title: 'Duyệt', cb_press: () {}),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: BtnPrimary(
                    title: 'Từ chối',
                    cb_press: () {},
                    color: Colors.red,
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
