import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorcare/screen/doctor/home_screen_doctor.dart';
import 'package:doctorcare/screen/user/home.dart';
import 'package:doctorcare/screen/user/sign_up.dart';
import 'package:doctorcare/ultis/auth_repository.dart';
import 'package:doctorcare/widget/base/BtnPrimary.dart';
import 'package:doctorcare/widget/base/TextFieldPrimary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: const Color(0xffEEEAFB),
        elevation: 0.0,
        foregroundColor: const Color(0xFF4702A2),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          'Ch??o m???ng b???n ?????n v???i App DoctorCare',
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
                          child: Text('Ng?????i D??ng'),
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
                          child: Text('B??c s??'),
                        )
                      ]),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                BtnPrimary(
                    title: '????ng nh???p',
                    cb_press: () {
                      setState(() {
                        // Future.delayed(Duration.zero, () async {
                        //   if (openLoading == false) {
                        //     log('open');
                        //     openLoading = true;
                        //     loading(context);
                        //   }
                        // });

                        _login(
                            emailTextController.text,
                            passwordTextController.text,
                            context,
                            roleController.toString().split('.').last);
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()))
                      }),
                      child: RichText(
                        text: TextSpan(
                          text: "Ch??a c?? t??i kho???n?",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
                          children: [
                            TextSpan(
                                text: '????ng k?? ngay',
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

  void _login(
      String email, String password, BuildContext context, String role) async {
    final authRepository = AuthenticationRepository();
    final result = await authRepository.logInWithEmailAndPassword(
        email: email, password: password);
    var id = await FirebaseAuth.instance.currentUser?.uid;
    final checkRoleUser = FirebaseFirestore.instance
        .collection('nguoidung')
        .where('id', isEqualTo: id);
    if (result) {
      if (role.compareTo('user') == 0) {
// ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomeScreen(id: id!)));
      } else {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeDoctorScreen(
                      id: id!,
                    )));
      }
    }
  }
  // ignore: use_build_context_synchronously

}

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
