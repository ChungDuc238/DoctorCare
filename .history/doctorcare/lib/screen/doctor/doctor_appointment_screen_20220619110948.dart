import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorcare/screen/doctor/widget/doctor_timing_data.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorAppointmentScreen extends StatefulWidget {
  final String id;
  const DoctorAppointmentScreen({super.key, required this.id});

  @override
  State<DoctorAppointmentScreen> createState() =>
      DoctorAppointmentScreenState();
}

class DoctorAppointmentScreenState extends State<DoctorAppointmentScreen> {
  Map<String, bool> list ={};

  List<String> listDay = [];
  DateTime dateTime = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  final List<String> genderItems = [
    'Phòng khám đa khoa miền trung',
    'Phòng khám Đa khoa Pasteur',
    'Phòng khám đa khoa quốc tế Vinmec'
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();
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
      body: SingleChildScrollView(
        child: Column(
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
                    margin: const EdgeInsets.all(16),
                    width: 150,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2196F3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Thêm',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () async {
                    int tmp = 0;
                    String result = await caKham(startTime, endTime);
                    if (list.isEmpty) {
                      list.addAll('add',);
                      setState(() {});
                    } else {
                      for (int i = 0; i < list.length; i++) {
                        if (list[i].compareTo(result) == 0) {
                          tmp = 1;
                        }
                      }
                      if (tmp == 0) {
                        list.add(result);
                        log(list.toString());
                        setState(() {});
                      } else {
                        print('looix');
                      }
                    }
                  },
                ),
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    width: 150,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 16, 16),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Xóa',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () async {
                    setState(() {
                      list = [];
                    });
                  },
                ),
              ],
            ),
            const Text('Chọn phòng khám'),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    DropdownButtonFormField2(
                      decoration: InputDecoration(
                        //Add isDense true and zero Padding.
                        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        //Add more decoration as you want here
                        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Chọn phòng khám',
                        style: TextStyle(fontSize: 14),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 60,
                      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      items: genderItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'chọn phòng khám';
                        }
                      },
                      onChanged: (value) async {
                        //Do something when changing the item if you want.
                        setState(() {
                          selectedValue = value.toString();
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          selectedValue = value.toString();
                        });
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            // Expanded(child: DropdownWidget()),
            Column(
              children: [
                Text('${dateTime.year}/${dateTime.month}/${dateTime.day}'),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: ((context, index) {
                    return DoctorTimingData(
                        time: list[index], isSelected: false);
                  }),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                ),
              ],
            ),
            ElevatedButton(
              child: const Text('hoàn thành'),
              onPressed: () async {
                putDataFirestore(
                    dayWork!, list, selectedValue.toString(), widget.id);
              },
            ),
          ],
        ),
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
  }
}

void putDataFirestore(
    String date, List list, String phongkham, String id) async {
  final result = await FirebaseFirestore.instance
      .collection('lichkham')
      .add({'ngay': date, 'thoigian': list, 'tenphongkham': phongkham, 'id': id});
  print(result);
}
