import 'package:flutter/material.dart';

class DoctorAppointmentScreen extends StatefulWidget {
  const DoctorAppointmentScreen({super.key});

  @override
  State<DoctorAppointmentScreen> createState() =>
      DoctorAppointmentScreenState();
}

class DoctorAppointmentScreenState extends State<DoctorAppointmentScreen> {
  DateTime dateTime = DateTime.now();
  DateTime dateTime1 = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Date and time'),
            ElevatedButton(
              child: Text('${dateTime.year}/${dateTime.month}/${dateTime.day}'),
              onPressed: () async {
                final date = await pickDate();
                if (date == null) return;
                setState(() {
                  dateTime = date;
                });
              },
            ),
            ElevatedButton(
              child: Text('$hours:$minute'),
              onPressed: () async {
                final time = await pickTime();
                if (time == null) return;
                final newDateTime = DateTime(
                  dateTime.year,
                  dateTime.month,
                  dateTime.day,
                  time.hour,
                  time.minute,
                );
                setState(() {
                  dateTime = newDateTime;
                });
              },
            ),
            ElevatedButton(
              child: Text('$hours:$minute'),
              onPressed: () async {
                final time = await pickTime1();
                if (time == null) return;
                final newDateTime = DateTime(
                  dateTime1.year,
                  dateTime1.month,
                  dateTime1.day,
                  time.hour,
                  time.minute,
                );
                setState(() {
                  dateTime1 = newDateTime;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2022),
        lastDate: DateTime(2023),
      );
  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
      );
  Future<TimeOfDay?> pickTime1() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime1.hour, minute: dateTime1.minute),
      );
}
