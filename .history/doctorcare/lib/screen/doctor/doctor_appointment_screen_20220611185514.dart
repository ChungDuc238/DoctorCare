import 'package:flutter/material.dart';

class DoctorAppointmentScreen extends StatefulWidget {
  const DoctorAppointmentScreen({super.key});

  @override
  State<DoctorAppointmentScreen> createState() =>
      DoctorAppointmentScreenState();
}

class DoctorAppointmentScreenState extends State<DoctorAppointmentScreen> {
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    final caKham;
    return Scaffold(
      body: ListView(
        children: [
          _buildTimePick("Start", true, startTime, (x) {
            setState(() {
              startTime = x;
              print(startTime.hour);
            });
          }),
          const SizedBox(height: 10),
          _buildTimePick("End", true, endTime, (x) {
            setState(() {
              endTime = x;

              print(endTime.hour);
            });
          }),
        ],
      ),
    );
  }
  caKham(TimeOfDay start, TimeOfDay end){
    final String result = 
  }
  Future selectedTime(BuildContext context, bool ifPickedTime,
      TimeOfDay initialTime, Function(TimeOfDay) onTimePicked) async {
    var _pickedTime =
        await showTimePicker(context: context, initialTime: initialTime);
    if (_pickedTime != null) {
      onTimePicked(_pickedTime);
    }
  }

  Widget _buildTimePick(String title, bool ifPickedTime, TimeOfDay currentTime,
      Function(TimeOfDay) onTimePicked) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            title,
          ),
        ),
        Container(
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
        ),
      ],
    );
    //   final hours = dateTime.hour.toString().padLeft(2, '0');
    //   final minute = dateTime.minute.toString().padLeft(2, '0');
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
