import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/screens/doctor/home.dart';
import 'package:doctor_app/screens/sign_up.dart';
import 'package:doctor_app/screens/user/home.dart';
import 'package:doctor_app/ultis/auth_repository.dart';
import 'package:doctor_app/widgets/base/BtnPrimary.dart';
import 'package:doctor_app/widgets/base/TextFieldPrimary.dart';
import 'package:doctor_app/widgets/loadingWidget.dart';
import 'package:doctorcare/screen/user/home.dart';
import 'package:doctorcare/ultis/auth_repository.dart';
import 'package:doctorcare/widget/base/BtnPrimary.dart';
import 'package:doctorcare/widget/base/TextFieldPrimary.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';


class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

enum Role { doctor, user }

class _SignInWidgetState extends State<SignInWidget> {
  //text controller
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;

  Role? roleController = Role.user;

  //vars are used to check showing error
  bool emailError = false;
  bool passwordError = false;

  bool openLoading = false;
  @override
  void initState() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffEEEAFB),
        elevation: 0.0,
        foregroundColor: Color(0xFF4702A2),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/illustration-1.png',
                  height: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Chào mừng bạn đến với App DoctorCare',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                  ],
                ),
                // Text(
                //   'Meet doctors with a simple touch',
                //   style: TextStyle(
                //     fontFamily: 'Quicksand',
                //     fontSize: 18,
                //   ),
                //   maxLines: 2,
                // ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldPrimary(
                  title: 'Email',
                  textController: emailTextController,
                ),
                if (emailError) _ErrorWidget(context, 'Incorrect email'),
                const SizedBox(
                  height: 8,
                ),
                TextFieldPrimary(
                  title: 'Password',
                  textController: passwordTextController,
                  isPassword: true,
                ),

                const SizedBox(
                  height: 8,
                ),
                if (passwordError) _ErrorWidget(context, 'Incorrect password'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(children: [
                        Radio<Role>(
                            value: Role.user,
                            groupValue: roleController,
                            onChanged: (Role? value) => {
                                  setState(() => {roleController = value})
                                }),
                        const Expanded(
                          child: Text('Người Dùng'),
                        )
                      ]),
                    ),
                    Expanded(
                      child: Row(children: [
                        Radio<Role>(
                            value: Role.doctor,
                            groupValue: roleController,
                            onChanged: (Role? value) => {
                                  setState(
                                    () => {roleController = value},
                                  )
                                }),
                        const Expanded(
                          child: Text('Bác sĩ'),
                        )
                      ]),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                BtnPrimary(
                    title: 'Đăng nhập',
                    cb_press: () {
                      setState(() {
                        // Future.delayed(Duration.zero, () async {
                        //   if (openLoading == false) {
                        //     log('open');
                        //     openLoading = true;
                        //     loading(context);
                        //   }
                        // });

                        _login(emailTextController.text,
                            passwordTextController.text, context);
                      });
                    }),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => ({
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()))
                      }),
                      child: RichText(
                        text: TextSpan(
                          text: "Chưa có tài khoản?",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
                          children: [
                            TextSpan(
                                text: 'Đăng ký ngay',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login(String email, String password, BuildContext context) async {
    final authRepository = AuthenticationRepository();
    final result = await authRepository.logInWithEmailAndPassword(
        email: email, password: password);
    
    if (result) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  // /*
  // SignIn function
  // */
  // void _SignIn(String email, String password, BuildContext context) async {
  //   //check empty field
  //   emailError = (email.isEmpty == true);
  //   passwordError = (password.isEmpty == true);

  //   if (!emailError && !passwordError) {
  //     //send request
  //     var response = await http.post(
  //       Uri.parse(globals.url + "/auth/login"),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body:
  //           jsonEncode(<String, String>{'email': email, 'password': password}),
  //     );

  //     //response
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> res = jsonDecode(response.body);
  //       print('sign in');

  //       //set token
  //       globals.token = res['data']['access_token'];
  //       globals.refresh_token = res['data']['refresh_token'];

  //       // get user
  //       response = await api_helper.get('/users/me');
  //       if (response.statusCode == 200) {
  //         var userJson = jsonDecode(response.body)['data'];

  //         //get role
  //         response = await api_helper.get("/roles/" + userJson['role']);

  //         if (response.statusCode == 200) {
  //           var roleJson = jsonDecode(response.body)['data'];
  //           String roleName = roleJson['name'];

  //           //check role
  //           if (roleController.toString().split('.').last.toLowerCase() ==
  //                   'doctor' &&
  //               roleName.toLowerCase() ==
  //                   roleController.toString().split('.').last.toLowerCase()) {
  //             //as doctor
  //             globals.user = User.fromJson(userJson);

  //             globals.user!.role = 'doctor';

  //             /* 
  //               TODO - login firebase 
  //             */
  //             AuthMethod authMethod = new AuthMethod();
  //             DatabaseMethod dbMethod = new DatabaseMethod();
  //             SharedPreferences prefs = await SharedPreferences.getInstance();
  //             prefs.setString("email", email);

  //             QuerySnapshot userByEmail = await dbMethod.getUserByEmail(email);

  //             print('${userByEmail.docs[0]['name']}');
  //             prefs.setString("id", userByEmail.docs[0].id);
  //             prefs.setString("name", userByEmail.docs[0]['name']);

  //             authMethod
  //                 .signInWithEmailAndPassword(email, password)
  //                 .then((value) {
  //               if (value != null) {
  //                 prefs.setBool("isLoggedIn", true);

  //                 if (openLoading == true) {
  //                   openLoading = false;
  //                   print('close');
  //                   Navigator.of(context, rootNavigator: true).pop();
  //                 }
  //                 //login successfully
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(builder: (context) => HomeDoctorScreen()),
  //                 );
  //               }
  //             });
  //           } else if (roleController
  //                       .toString()
  //                       .split('.')
  //                       .last
  //                       .toLowerCase() ==
  //                   'user' &&
  //               roleName.toLowerCase() ==
  //                   roleController.toString().split('.').last.toLowerCase()) {
  //             //as patient
  //             globals.user = User.fromJson(userJson);

  //             globals.user!.role = 'user';

  //             /* 
  //               TODO - login firebase 
  //             */
  //             AuthMethod authMethod = new AuthMethod();
  //             DatabaseMethod dbMethod = new DatabaseMethod();
  //             SharedPreferences prefs = await SharedPreferences.getInstance();
  //             prefs.setString("email", email);

  //             QuerySnapshot userByEmail = await dbMethod.getUserByEmail(email);

  //             print('${userByEmail.docs[0]['name']}');
  //             prefs.setString("id", userByEmail.docs[0].id);
  //             prefs.setString("name", userByEmail.docs[0]['name']);

  //             authMethod
  //                 .signInWithEmailAndPassword(email, password)
  //                 .then((value) {
  //               if (value != null) {
  //                 prefs.setBool("isLoggedIn", true);

  //                 if (openLoading == true) {
  //                   openLoading = false;
  //                   print('close');
  //                   Navigator.of(context, rootNavigator: true).pop();
  //                 }

  //                 //login successfully
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(builder: (context) => const HomeWidget()),
  //                 );
  //               }
  //             });
  //           } else {
  //             //incorrect
  //             globals.refresh_token = '';
  //             globals.token = '';
  //             emailError = true;
  //             passwordError = true;
  //           }
  //         } else {
  //           globals.refresh_token = '';
  //           globals.token = '';
  //           emailError = true;
  //           passwordError = true;
  //         }
  //       }
  //     } else {
  //       emailError = true;
  //       passwordError = true;
  //     }
  //   }
  //   // print('continue');
  //   setState(() {});
  // }

  //show error for email and password
  Widget _ErrorWidget(BuildContext context, String text) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.only(bottom: 5, top: 5, left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.red[100],
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(children: [
              Icon(
                Icons.error_rounded,
                color: Colors.red,
                size: 20,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}