
import 'package:doctorcare/screen/doctor/home_screen_doctor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../user/chat_room.dart';

class BottomNavigatorDoctor extends StatelessWidget {
  final int currentIndex;
  const BottomNavigatorDoctor({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.house,
            size: 24,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.calendarDay,
            size: 24,
          ),
          label: 'Appointments',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.solidCommentDots,
            size: 24,
          ),
          label: 'Message',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.solidUser,
            size: 24,
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: const Color(0xFF4702A2),
      unselectedItemColor: const Color(0xFFc4abf5),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        if (index == 0) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HomeDoctorScreen(id: '',)));
        } else if (index == 1) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const MyAppoinmentScreen()));
        } else if (index == 2) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ChatRoomScreen()));
        } else if (index == 3) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ProfilePage()));
        }
      },
    );
  }
}