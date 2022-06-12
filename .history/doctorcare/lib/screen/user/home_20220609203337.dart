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
            _doctorItem(context)
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarCustom(currentIndex: 0),
    );
  }

//
  Widget listDoctor(BuildContext context) {
    final Stream<QuerySnapshot> listDoctor =
        FirebaseFirestore.instance.collection('BacSi').snapshots();
    return StreamBuilder<QuerySnapshot>(
        stream: listDoctor,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                return Container(
                  margin: const EdgeInsets.all(12.0),
                  child: _doctorItem(context, '${data.docs[index]}', benhvien, chuyenmon),
                );
              });
        });
  }

  // hiển thị danh sách bác sĩ theo khoa
  Widget upCommingAppointment(BuildContext context) {
    final Stream<QuerySnapshot> listAppoinment =
        FirebaseFirestore.instance.collection('Khoa').snapshots();

    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 1,
            child: Text(
              'Danh mục bác sĩ theo chuyên môn',
            ),
          ),
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
                      return Container(
                        margin: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child:
                                  Image.network('${data.docs[index]['hinh']}'),
                            ),
                            Text('${data.docs[index]['TenKhoa']}'),
                          ],
                        ),
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _doctorItem(BuildContext context, String ten, String benhvien, String chuyenmon) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => DoctorInfoScreen(user.id ?? '')));
      },
      child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // user.avataId!.isNotEmpty
                //     ? ClipRRect(
                //         child: Image.network(
                //           ''
                //         ),
                //         borderRadius: const BorderRadius.all(Radius.circular(16)),
                //       )
                //     :,
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Image.asset(
                    'assets/logo/small_logo.png',
                    height: 80,
                    width: 80,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        ten,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        benhvien,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        chuyenmon,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                )
              ],
            ));
      }),
    );
  }
}
