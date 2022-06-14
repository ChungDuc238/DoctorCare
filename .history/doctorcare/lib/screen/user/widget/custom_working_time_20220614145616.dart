
import 'package:doctorcare/screen/doctor/doctor_appointment_screen.dart';
import 'package:flutter/material.dart';

class CustomWorkingTimeScreen extends StatefulWidget {
 final String? date;
 final int? lenght;
  const CustomWorkingTimeScreen({super.key, this.date, required this.lenght});

  @override
  State<CustomWorkingTimeScreen> createState() => _CustomWorkingTimeScreenState();
}

class _CustomWorkingTimeScreenState extends State<CustomWorkingTimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
              children: [
                Text(widget.date??'Hiện tại chưa có lịch khám'),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: widget.length??0,
                  itemBuilder: ((context, index) {
                    return doctorTimingsData(list[index], false);
                  }),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                ),
              ],
            ),
  }
}