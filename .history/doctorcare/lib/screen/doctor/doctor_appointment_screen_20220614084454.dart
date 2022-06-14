import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorcare/screen/doctor/list_working.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorAppointmentScreen extends StatefulWidget {
  const DoctorAppointmentScreen({super.key});

  @override
  State<DoctorAppointmentScreen> createState() =>
      DoctorAppointmentScreenState();
}

class DoctorAppointmentScreenState extends State<DoctorAppointmentScreen> {
  List<String> list = [];

  List<String> listDay = [];
  DateTime dateTime = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    String? dayWork = '${dateTime.year}/${dateTime.month}/${dateTime.day}';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffEEEAFB),
        elevation: 0.0,
        foregroundColor: const Color(0xFF4702A2),
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.chevronLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Cập nhật lịch làm việc',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.commentDots))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Chọn thời gian làm việc',
            style: TextStyle(fontSize: 21),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16.0),
                width: 150,
                child: ElevatedButton(
                  child: Text(
                      '${dateTime.year}/${dateTime.month}/${dateTime.day}'),
                  onPressed: () async {
                    final date = await pickDate();
                    if (date == null) return;
                    setState(() {
                      dateTime = date;
                      dayWork =
                          '${dateTime.year}/${dateTime.month}/${dateTime.day}';
                    });
                  },
                ),
              ),
              _buildTimePick("Start", true, startTime, (x) {
                setState(() {
                  startTime = x;
                  // print(startTime.hour);
                });
              }),
              const SizedBox(height: 10),
              _buildTimePick("End", true, endTime, (x) {
                setState(() {
                  endTime = x;

                  // print(endTime.hour);
                });
              }),
            ],
          ),
          Row(
            children: [
              InkWell(
                child: Container(
                    width: 150,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFF2196F3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(child: Text('Thêm'))),
                onTap: () async {
                  int tmp = 0;
                  String result = await caKham(startTime, endTime);
                  if (list.isEmpty) {
                  } else {
                    for (int i = 0; i < list.length; i++) {
                      if (list[i].compareTo(result) == 0) {
                        tmp = 1;
                      }
                    }
                    if (tmp == 0) {
                      list.add(result);
                      print(list);
                      setState(() {});
                    }
                  }
                },
              ),
              Inwe(
                child: const Text('Xóa'),
                onPressed: () async {
                  setState(() {
                    list = [];
                  });
                },
              ),
            ],
          ),
          Column(
            children: [
              Text('${dateTime.year}/${dateTime.month}/${dateTime.day}'),
              GridView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: ((context, index) {
                  return doctorTimingsData(list[index], false);
                }),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
              ),
            ],
          ),
          ElevatedButton(
            child: const Text('hoàn thành'),
            onPressed: () async {
              putDataFirestore(dayWork!, list);
              print('aaaaa');
            },
          ),
        ],
      ),
    );
  }

  String caKham(TimeOfDay start, TimeOfDay end) {
    return '${start.hour}:${start.minute}-${end.hour}:${end.minute}';
  }

  Future selectedTime(BuildContext context, bool ifPickedTime,
      TimeOfDay initialTime, Function(TimeOfDay) onTimePicked) async {
    var pickedTime =
        await showTimePicker(context: context, initialTime: initialTime);
    if (pickedTime != null) {
      onTimePicked(pickedTime);
    }
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2022),
        lastDate: DateTime(2023),
      );
  Widget _buildTimePick(String title, bool ifPickedTime, TimeOfDay currentTime,
      Function(TimeOfDay) onTimePicked) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(),
        // borderRadius: BorderRadius.circular(20),
      ),
      child: GestureDetector(
        child: Text(
          currentTime.format(context),
        ),
        onTap: () {
          selectedTime(context, ifPickedTime, currentTime, onTimePicked);
        },
      ),
    );
    // final hours = dateTime.hour.toString().padLeft(2, '0');
    // final minute = dateTime.minute.toString().padLeft(2, '0');
    //   return Scaffold(
    //     body: Container(
    //       padding: EdgeInsets.all(16.0),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text('Date and time'),
    //           ElevatedButton(
    //             child: Text('${dateTime.year}/${dateTime.month}/${dateTime.day}'),
    //             onPressed: () async {
    //               final date = await pickDate();
    //               if (date == null) return;
    //               setState(() {
    //                 dateTime = date;
    //               });
    //             },
    //           ),
    //           ElevatedButton(
    //             child: Text('$hours:$minute'),
    //             onPressed: () async {
    //               final time = await pickTime();
    //               if (time == null) return;
    //               final newDateTime = DateTime(
    //                 dateTime.year,
    //                 dateTime.month,
    //                 dateTime.day,
    //                 time.hour,
    //                 time.minute,
    //               );
    //               setState(() {
    //                 dateTime = newDateTime;
    //               });
    //             },
    //           ),
    //           ElevatedButton(
    //             child: Text('$hours:$minute'),
    //             onPressed: () async {
    //               final time = await pickTime();
    //               if (time == null) return;
    //               final newDateTime = DateTime(
    //                 dateTime.year,
    //                 dateTime.month,
    //                 dateTime.day,
    //                 time.hour,
    //                 time.minute,
    //               );
    //               setState(() {
    //                 dateTime1 = newDateTime;
    //               });
    //             },
    //           )
    //         ],
    //       ),
    //     ),
    //   );
    // }

    // Future<DateTime?> pickDate() => showDatePicker(
    //       context: context,
    //       initialDate: dateTime,
    //       firstDate: DateTime(2022),
    //       lastDate: DateTime(2023),
    //     );
    // Future<TimeOfDay?> pickTime() => showTimePicker(
    //       context: context,
    //       initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
    //     );
  }
}

Widget doctorTimingsData(String time, bool isSelected) {
  return isSelected
      ? Container(
          margin: const EdgeInsets.only(left: 20, top: 10),
          decoration: BoxDecoration(
            color: const Color(0xff107163),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 2),
                child: const Icon(
                  Icons.access_time,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 2),
                child: Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ],
          ),
        )
      : Container(
          margin: const EdgeInsets.only(left: 20, top: 10),
          decoration: BoxDecoration(
            color: const Color(0xffEEEEEE),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 2),
                child: const Icon(
                  Icons.access_time,
                  color: Colors.black,
                  size: 18,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 2),
                child: Text(
                  time,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ],
          ),
        );
}

void putDataFirestore(String date, List list) async {
  final result = await FirebaseFirestore.instance
      .collection('demo')
      .add({'date': date, 'list': list});
  print(result);
}
