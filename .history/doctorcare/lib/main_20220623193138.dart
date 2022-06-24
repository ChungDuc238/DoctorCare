import 'package:doctorcare/screen/doctor/doctor_appointment_screen.dart';
import 'package:doctorcare/screen/doctor/home_screen_doctor.dart';
import 'package:doctorcare/screen/user/home.dart';
import 'package:doctorcare/screen/user/sign_in/sign_in.dart';
import 'package:doctorcare/screen/user/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  SystemChrome
    
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInWidget(),
    );
  }
}
