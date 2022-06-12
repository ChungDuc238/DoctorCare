import 'package:flutter/material.dart';

class DoctorAppointmentScreen extends StatefulWidget {
  const DoctorAppointmentScreen({super.key});

  @override
  State<DoctorAppointmentScreen> createState() =>
      DoctorAppointmentScreenState();
}

class DoctorAppointmentScreenState extends State<DoctorAppointmentScreen> {
  DateTime dateTime = DateTime.now();
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
              child: Text('$hour:$minute'),
              onPressed: () async {
                final date = await pickDate();
                if (date == null) return;
                setState(() {
                  dateTime = date;
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
}