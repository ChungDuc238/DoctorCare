import 'package:flutter/material.dart';

class DoctorTimingData extends StatefulWidget {
  DoctorTimingData({super.key, this.time, this.isSelected});
  final String? time;
  bool? isSelected;
  @override
  State<DoctorTimingData> createState() => _DoctorTimingDataState();
}

class _DoctorTimingDataState extends State<DoctorTimingData> {
  static String demo = '';
  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: () {
              setState(() {
                widget.isSelected = true;
                print(widget.time);
              });
            },
            child: Container(
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
                      widget.time ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
