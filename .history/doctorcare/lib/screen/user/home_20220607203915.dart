import 'package:doctorcare/widget/base/InputSearch.dart';
import 'package:doctorcare/widget/user/bottomNavigationBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController searchController;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffEEEAFB),
          elevation: 0,
          titleSpacing: 0,
          flexibleSpace: Container(
            padding:
                const EdgeInsets.only(top: 72, bottom: 16, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 32.0,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/736x/e5/fd/e2/e5fde2d2665c21b70448259c94c97979.jpg'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Chào mừng bạn quay trở lại,',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'bác sĩ Trang',
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: InputSearch(
                title: 'Search doctor',
                textController: searchController,
                cb_tap: () {},
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarCustom(currentIndex: 0),
    );
  }
}
