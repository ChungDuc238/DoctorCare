import 'package:doctorcare/screen/doctor/doctor_appointment_screen.dart';
import 'package:doctorcare/screen/doctor/widget/doctor_timing_data.dart';
import 'package:flutter/material.dart';

class CustomWorkingTimeScreen extends StatefulWidget {
  final String? date;
  final int? length;
  final List? time;
  final String? phongkham;
  const CustomWorkingTimeScreen({super.key, this.date, this.length, this.time, this.phongkham});

  @override
  State<CustomWorkingTimeScreen> createState() =>
      _CustomWorkingTimeScreenState();
}

class _CustomWorkingTimeScreenState extends State<CustomWorkingTimeScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          child: Text(
            widget.date ?? 'Hiện tại chưa có lịch khám',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          widget.phongkham ?? '',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        GridView.builder(
          shrinkWrap: true,
          itemCount: widget.length,
          itemBuilder: ((context, index) {
            return InkWell(
                child: DoctorTimingData(
                    time: widget.time?[index], isSelected: false));
          }),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
        ),
      ],
    );
  }
}
