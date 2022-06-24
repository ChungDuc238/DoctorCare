import 'package:doctorcare/screen/doctor/doctor_appointment_screen.dart';
import 'package:doctorcare/screen/doctor/widget/bottom_navigator_bar.dart';
import 'package:doctorcare/widget/user/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeDoctorScreen extends StatefulWidget {
  final String id;
  const HomeDoctorScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<HomeDoctorScreen> createState() => _HomeDoctorScreenState();
}

class _HomeDoctorScreenState extends State<HomeDoctorScreen> {
  // var controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    // controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/logo/new_logo.png',
                      width: 40,
                      height: 40,
                    )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Chào mừng bạn quay trở lại,',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                  Text(
                    'tên bác sĩ',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.transparent,
        child: Column(
          children: [
            upCommingAppointments(context, widget.id),
            const SizedBox(height: 24),
            pendingAppointments(context, widget.id)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigatorDoctor(
        currentIndex: 1,
      ),
    );
  }
}

Widget upCommingAppointments(BuildContext context, String id) {
  return Container(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Lịch khám sắp tới',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DoctorAppointmentScreen(
                          id: id,
                        )));
              },
              child: Row(
                children: const [
                  Text(
                    'More',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF60A5FA),
                        fontWeight: FontWeight.w700),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Color(0xFF60A5FA),
                  )
                ],
              ),
            )
          ],
        ),
        LayoutBuilder(builder: (context, constraints) {
          return Container(
            height: 200,
            child: ListView.builder(
                shrinkWrap: true,
                // scrollDirection: Axis.vertical,
                itemCount: 0,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      upComingAppointmentItem(context, index),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  );
                }),
          );
        })
      ],
    ),
  );
}

Widget upComingAppointmentItem(BuildContext context, int index) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return Row(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(246, 241, 239, 239),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFECECEC))),
              width: constraints.maxWidth * 0.85,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.network(
                      'https://www.hoanmydanang.com/upload/hoanmydanang.com/images/employee/2019-03-19/thumbnail_1552982584_qFMdqVKuJM.jpg',
                      height: 60,
                      width: 60,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    width: constraints.maxWidth * 0.85 - 95,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'tên bác siz',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: const BoxDecoration(
                                  color: Color(0xFFFFC700),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: const Text(
                                'chọn ngày',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
          IconButton(
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => AppointmentDetailScreen(
              //             controller.upcommingAppointments[index].id ?? -1)));
            },
            icon: Icon(Icons.arrow_forward_ios),
            color: Color(0xFFB3B3B3),
          ),
        ],
      );
    },
  );
}

/*
appointment wait for approving
*/
Widget pendingAppointments(BuildContext context, String id) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Chỉnh sửa lịch khám',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DoctorAppointmentScreen(
                        id: id,
                      )));
            },
            child: Row(
              children: const [
                Text(
                  'More',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF60A5FA),
                      fontWeight: FontWeight.w700),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Color(0xFF60A5FA),
                )
              ],
            ),
          )
        ],
      ),
      // LayoutBuilder(builder: (context, constraints) {
      //   return Container(
      //     height: controller.pendingAppointments.length * (90 + 16),
      //     child: ListView.builder(
      //         shrinkWrap: true,
      //         // scrollDirection: Axis.vertical,
      //         itemCount: controller.pendingAppointments.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           print('index ' + index.toString());
      //           return Column(
      //             children: [
      //               pendingAppointmentItem(context, index),
      //               SizedBox(
      //                 height: 16,
      //               )
      //             ],
      //           );
      //         }),
      //   );
      // })
    ],
  );
}

  // Widget pendingAppointmentItem(BuildContext context, int index) {
  //   print(controller.patientsForPending[0].firstName);
  //   return LayoutBuilder(
  //     builder: (context, constraints) {
  //       return Row(
  //         children: [
  //           Container(
  //               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //               decoration: BoxDecoration(
  //                   color: Color.fromARGB(246, 241, 239, 239),
  //                   borderRadius: BorderRadius.circular(10),
  //                   border: Border.all(color: Color(0xFFECECEC))),
  //               width: constraints.maxWidth * 0.85,
  //               child: Row(
  //                 children: [
  //                   (controller.patientsForPending.value[index].avataId != '' &&
  //                           controller
  //                                   .patientsForPending.value[index].avataId !=
  //                               null)
  //                       ? ClipRRect(
  //                           child: Image.network(
  //                             globals.url +
  //                                 "/assets/" +
  //                                 controller
  //                                     .patientsForPending.value[index].avataId!,
  //                             headers: {
  //                               "authorization": "Bearer " + globals.token
  //                             },
  //                             height: 60,
  //                             width: 60,
  //                           ),
  //                           borderRadius: BorderRadius.all(Radius.circular(10)),
  //                         )
  //                       : ClipRRect(
  //                           borderRadius: BorderRadius.all(Radius.circular(10)),
  //                           child: Image.asset(
  //                             'assets/logo/small_logo.png',
  //                             height: 60,
  //                             width: 60,
  //                           ),
  //                         ),
  //                   SizedBox(
  //                     width: 8,
  //                   ),
  //                   Container(
  //                     width: constraints.maxWidth * 0.85 - 95,
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       mainAxisSize: MainAxisSize.min,
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           controller.patientsForPending[index].firstName +
  //                               ' ' +
  //                               controller.patientsForPending[index].lastName,
  //                           maxLines: 1,
  //                           style: TextStyle(
  //                               fontSize: 14,
  //                               color: Colors.black,
  //                               fontWeight: FontWeight.bold),
  //                         ),
  //                         SizedBox(
  //                           height: 3,
  //                         ),
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Text(
  //                               DateFormat('MMMM dd, yyyy').format(
  //                                   controller.pendingAppointments[index].time),
  //                               style: TextStyle(
  //                                 fontSize: 14,
  //                               ),
  //                             ),
  //                             Container(
  //                               padding: EdgeInsets.symmetric(
  //                                   horizontal: 10, vertical: 5),
  //                               decoration: BoxDecoration(
  //                                   color: Color(0xFFFFC700),
  //                                   borderRadius:
  //                                       BorderRadius.all(Radius.circular(20))),
  //                               child: Text(
  //                                 DateFormat('HH:mm ').format(controller
  //                                     .pendingAppointments[index].time),
  //                                 style: TextStyle(
  //                                     fontSize: 14,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: Colors.white),
  //                               ),
  //                             ),
  //                           ],
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               )),
  //           IconButton(
  //             onPressed: () {
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => AppointmentDetailScreen(
  //                           controller.pendingAppointments[index].id ?? -1)));
  //             },
  //             icon: Icon(Icons.arrow_forward_ios),
  //             color: Color(0xFFB3B3B3),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

