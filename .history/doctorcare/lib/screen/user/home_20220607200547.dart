
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffEEEAFB),
          elevation: 0,
          titleSpacing: 0,
          flexibleSpace: Container(
            padding: EdgeInsets.only(top: 72, bottom: 16, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // CircleAvatar(
                //   radius: 32.0,
                //   backgroundImage: globals.user!.avataId != null
                //       ? NetworkImage(
                //           globals.url + "/assets/" + globals.user!.avataId!)
                //       : NetworkImage(globals.url +
                //           "/assets/9c38b55b-70a9-43f5-aad6-0bd1862143ad"),
                // ),
                
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Xin chào',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      globals.user!.firstName + ' ' + globals.user!.lastName,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: InputSearch(
                title: 'Search doctor',
                textController: searchController,
                cb_tap: () {},
              ),
            ),
            upCommingAppointment(context),
            _specialistDoctorWidget(context),
            SizedBox(height: 16),
            _DoctorListWiget(upcomming)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarCustom(currentIndex: 0),
    );
  }
}