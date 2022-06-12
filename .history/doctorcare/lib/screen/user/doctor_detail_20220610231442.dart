import 'package:flutter/material.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key, required this.id});
  final String id;
  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
      
    return Scaffold(
      backgroundColor: clr4,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: primary, //change your color here
        ),
        title: Text(
          "Prof. Col. Dr. Nazli Hameed",
          style: TextStyle(fontSize: 17, color: primary),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.share_rounded,
              color: primary,
              size: 20,
            ),
          ),
        ],
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                height: 200,
                width: size.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/Doc (2).png"),
                          radius: 40,
                        ),
                        title: Text(
                          "Prof. Col. Dr. Nazli Hameed",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        subtitle: Text(
                          // maxLines: 2,
                          // overflow: TextOverflow.ellipsis,
                          "Gyneocoloist, Obstetician \nMBB,S FCPS (Gynecology & Obstetrician)",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          RichText(
                            text: const TextSpan(
                              text: 'Under 15 Min \n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Wait Time',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.grey)),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            child: VerticalDivider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: '33 Years \n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Experience',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.grey)),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            child: VerticalDivider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: '98% (638) \n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Satisfied',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.grey)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                height: 300,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Book Appointment",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Ashraf Medical Surgical Complex",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Fee: ',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'RS. 1000',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.circle_rounded,
                            size: 14,
                            color: Colors.green,
                          ),
                          Text(
                            "Available Today",
                            style: TextStyle(color: Colors.green, fontSize: 14),
                          ),
                          Spacer(),
                          Text(
                            "02:00 PM - 05:00 PM",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Colors.black,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: SizedBox(
                          width: size.width * 0.8,
                          height: 50,
                          child: ElevatedButton(
                            child: Text(
                              "Book Appointment",
                              // style: TextStyle(color: textColor),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Book(),
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                primary: secondary,
                                onPrimary: Colors.white,
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 300,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Online Video Consultation",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Ashraf Medical Surgical Complex",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Fee: ',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'RS. 1000',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.circle_rounded,
                            size: 14,
                            color: Colors.green,
                          ),
                          Text(
                            "Available Today",
                            style: TextStyle(color: Colors.green, fontSize: 14),
                          ),
                          Spacer(),
                          Text(
                            "02:00 PM - 05:00 PM",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Colors.black,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: SizedBox(
                          width: size.width * 0.8,
                          height: 50,
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.videocam_rounded,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Book Video Consultation ",
                            ),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                primary: primary,
                                onPrimary: Colors.white,
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 300,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.black,
                          ),
                          Text(
                            "Reviews of Dr. Safdar Iqbal",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            "(10)",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: Column(
                                children: <Widget>[
                                  Center(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 40,
                                      child: Text(
                                        "100%",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Satisfied out of \n10 Patients",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              )),
                          Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Doctor checkup (100%)",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    color: Colors.black,
                                    thickness: 3,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Clinic Environment (100%)",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    color: Colors.black,
                                    thickness: 3,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Staff behviour (100%)",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    color: Colors.black,
                                    thickness: 3,
                                  ),
                                ],
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            speclization(context, "Services", "Antenatal",
                "Caesrean Section / C-Section"),
            SizedBox(
              height: 20,
            ),
            speclization(context, "Conditions Treated", "Menopause",
                "Infectious Disease"),
            SizedBox(
              height: 20,
            ),
            speclization(context, "Education", "MBB,S 1989",
                "F.C.P.S (Gynecology & Obdterics), 2010"),
            // Center(
            //   child: Container(
            //     // height: 300,
            //     width: size.width * 0.9,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(20.0),
            //         color: Colors.white),
            //     child: Padding(
            //       padding: const EdgeInsets.all(20.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         // mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: <Widget>[
            //           Text(
            //             "Education",
            //             style: TextStyle(
            //                 fontSize: 16, fontWeight: FontWeight.bold),
            //           ),
            //           SizedBox(
            //             height: 10,
            //           ),
            //           Divider(
            //             color: Colors.grey,
            //             thickness: 1,
            //           ),
            //           SizedBox(
            //             height: 30,
            //           ),
            //           Row(
            //             children: <Widget>[
            //               Expanded(
            //                 flex: 2,
            //                 child: Column(
            //                   children: [
            //                     RichText(
            //                       text: TextSpan(
            //                         children: [
            //                           WidgetSpan(
            //                             child: Icon(
            //                               Icons.circle_rounded,
            //                               color: Colors.black,
            //                               size: 8,
            //                             ),
            //                           ),
            //                           TextSpan(
            //                               text: "MBB,S 1989",
            //                               style: TextStyle(
            //                                   fontSize: 15,
            //                                   color: Colors.black)),
            //                         ],
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               Expanded(
            //                 flex: 2,
            //                 child: Column(
            //                   children: [
            //                     RichText(
            //                       text: TextSpan(
            //                         children: [
            //                           WidgetSpan(
            //                             child: Icon(
            //                               Icons.circle_rounded,
            //                               color: Colors.black,
            //                               size: 8,
            //                             ),
            //                           ),
            //                           TextSpan(
            //                               text:
            //                                   "F.C.P.S (Gynecology & Obdterics), 2010",
            //                               style: TextStyle(
            //                                   fontSize: 15,
            //                                   color: Colors.black)),
            //                         ],
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               )
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            details(context, "Specialization", "Gynecologist, Obstetrician"),
            SizedBox(
              height: 20,
            ),
            details(context, "Experience",
                "2011 - 2019, SENIOR REGISTRAR, Jinnah Hospital"),

            SizedBox(
              height: 20,
            ),
            details(context, "Professional Memberships",
                "Pakistan of Ostetricians and Gyneecologist of Pakistan"),

            SizedBox(
              height: 20,
            ),
            details(context, "Languages Spoken", "English"),

            SizedBox(height: 20),
            details(context, "About Prof. Col. Dr. Nazli Hameed", "we do care"),

            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Similar Doctors",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 180,
                        width: size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                    height: size.height * 0.2,
                                    width: size.width * 0.78,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                              flex: 2,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  CircleAvatar(
                                                      radius: 30,
                                                      backgroundImage: AssetImage(
                                                          "assets/Doc (2).png")),
                                                  SizedBox(height: 5),
                                                  Icon(
                                                    Icons.thumb_up_alt_rounded,
                                                    color: Colors.grey,
                                                  ),
                                                  Text(
                                                    "100%",
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              )),
                                          Expanded(
                                              flex: 3,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "Prof. Col. Dr. Nazli Hameed",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "18 Years Experience",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.circle_rounded,
                                                        size: 12,
                                                        color: Colors.green,
                                                      ),
                                                      Text(
                                                        "Available Tommorrow",
                                                        style: TextStyle(
                                                            color: Colors.green,
                                                            fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  SizedBox(
                                                    width: size.width * 0.40,
                                                    height: 40,
                                                    child: ElevatedButton(
                                                      child: Text(
                                                        "Book Appointment",
                                                        // style: TextStyle(color: textColor),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Book(),
                                                            ));
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0)),
                                                          primary: secondary,
                                                          onPrimary:
                                                              Colors.white,
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  )
                                                ],
                                              )),
                                        ],
                                      ),
                                    )),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                width: size.width * 0.4,
                height: 50,
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Call Now ",
                    // style: TextStyle(color: textColor),
                  ),
                  onPressed: () async {
                    final Uri lanuchUri = Uri(
                      scheme: "tel",
                      path: "042-37210620",
                    );
                    if (await canLaunchUrl(lanuchUri)) {
                      await launchUrl(lanuchUri);
                    } else {
                      print("The action is not supported. (No Phone app) ");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      primary: primary,
                      onPrimary: Colors.white,
                      textStyle: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                width: size.width * 0.4,
                height: 50,
                child: ElevatedButton(
                  child: Text(
                    "Book Appointment",
                    // style: TextStyle(color: textColor),
                  ),
                  onPressed: () => onpressed(context),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      primary: secondary,
                      onPrimary: Colors.white,
                      textStyle: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
}
