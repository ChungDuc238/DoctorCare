
import 'package:flutter/material.dart';

class CustomWorkingTimeScreen extends StatefulWidget {
 final String? date;
  const CustomWorkingTimeScreen({super.key});

  @override
  State<CustomWorkingTimeScreen> createState() => _CustomWorkingTimeScreenState();
}

class _CustomWorkingTimeScreenState extends State<CustomWorkingTimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
  }
}