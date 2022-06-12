import 'package:doctorcare/widget/base/InputSearch.dart';
import 'package:doctorcare/widget/user/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';

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
            upCommingAppointment(context),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarCustom(currentIndex: 0),
    );
  }

  Widget upCommingAppointment(BuildContext context) {
    final Stream<QuerySnapshot> listAppoinment =
        FirebaseFirestore.instance.collection('Khoa').snapshots();

    return SizedBox(
      height: 200,
      child: Column(
        children: [
          const Expanded(
              flex: 1, child: Text('Danh mục bác sĩ theo chuyên môn')),
          Expanded(
            flex: 4,
            child: StreamBuilder<QuerySnapshot>(
              stream: listAppoinment,
              builder: (BuildContext conntext,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Lỗi khi lấy dữ liệu');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading');
                }
                final data = snapshot.requireData;
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text('${data.docs[index]['TenKhoa']}'),
                          Image.network(
                              'https://www.google.com/imgres?imgurl=http%3A%2F%2Fbenhvienhongphat.vn%2Fwp-content%2Fuploads%2F2018%2F04%2Ficon-khoa-tim-mach.png&imgrefurl=http%3A%2F%2Fbenhvienhongphat.vn%2Ficon-khoa-tim-mach%2F&tbnid=92-dFdD02URiyM&vet=12ahUKEwiCyc6jwpv4AhXgiNgFHQ39CsgQMygEegUIARCNAQ..i&docid=_gn7uIypYuTq_M&w=300&h=300&q=icon%20c%C3%A1c%20khoa%20trong%20b%E1%BB%87nh%20vi%E1%BB%87n&ved=2ahUKEwiCyc6jwpv4AhXgiNgFHQ39CsgQMygEegUIARCNAQ'),
                        ],
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
