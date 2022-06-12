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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.zero,
              height: 290,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Color(0xFF009688)),
              child: Stack(children: [
                const Positioned(
                  top: 20,
                  right: 0,
                  child: SizedBox(
                    width: 260,
                    height: 370,
                    child: Image(
                      image: AssetImage('assets/logo/small_logo.png'),
                    ),
                  ),
                ),
                Positioned(
                    bottom: -3,
                    left: 0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)))),
                      onPressed: () {},
                      // child: SizedBox(
                      //   width: 10,
                      //   height: 10,
                      //   child: Row(
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.only(right: 3.0),
                      //         child: Text(widget.id),
                      //       ),
                      //       const Icon(Icons.star, size: 20)
                      //     ],
                      //   ),
                      // ),
                    )),
                Positioned(
                    top: 30,
                    left: 3,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ))),
              ]),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 10, 0),
              child: Text(
                "tên bác sĩ",
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on_outlined),
                  Text('bệnh viện'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 77, 75, 72)
                          .withOpacity(0.2)),
                  onPressed: () {},
                  child: Text('widget.doctor.specialist!',
                      style: const TextStyle(color: Colors.amber))),
            ),
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: ListTile(
                  subtitle: Text(
                    'widget.doctor.descone!',
                    textAlign: TextAlign.justify,
                  ),
                )),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100,
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "162",
                          style: TextStyle(
                              color: Color(0xFF009688),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("Patients")
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "4 +",
                          style: TextStyle(
                              color: Color(0xFF009688),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("Exp. year")
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "4273",
                          style: TextStyle(
                              color: Color(0xFF009688),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("Ratings")
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: ListTile(
                  subtitle: Text(
                    'widget.doctor.desctwo!',
                    textAlign: TextAlign.justify,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
