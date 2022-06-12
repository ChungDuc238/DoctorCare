import 'package:doctorcare/screen/user/home.dart';
import 'package:doctorcare/screen/user/sign_in/sign_in.dart';
import 'package:doctorcare/ultis/auth_repository.dart';
import 'package:doctorcare/widget/base/BtnPrimary.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doctorcare/widget/base/TextFieldPrimary.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

enum Role { doctor, user }

class _SignUpScreenState extends State<SignUpScreen> {
  Role? _role = Role.user;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController firstNameController;
  final formSignUp = GlobalKey<FormState>();
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    firstNameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffEEEAFB),
        elevation: 0.0,
        foregroundColor: const Color(0xFF4702A2),
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.chevronLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Form(
              key: formSignUp,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/illustration-2.png',
                      height: 200,
                    ),
                    Text(
                      'Chào mừng bạn đến với App DoctorCare',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldPrimary(
                      title: 'Email',
                      textController: emailController,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFieldPrimary(
                      title: 'Password',
                      isPassword: true,
                      textController: passwordController,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFieldPrimary(
                      title: 'Tên',
                      textController: firstNameController,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(children: [
                      Expanded(
                        child: Row(
                          children: [
                            Radio(
                              value: Role.user,
                              groupValue: _role,
                              onChanged: (Role? value) {
                                setState(() {
                                  _role = value;
                                });
                              },
                            ),
                            const Expanded(
                              child: Text('Người dùng'),
                            )
                          ],
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Radio<Role>(
                              value: Role.doctor,
                              groupValue: _role,
                              onChanged: (Role? value) {
                                setState(() {
                                  _role = value;
                                });
                              },
                            ),
                            const Expanded(
                              child: Text(
                                'Bác sĩ',
                              ),
                            )
                          ],
                        ),
                        flex: 1,
                      ),
                    ]),
                    SizedBox(
                      height: 16,
                    ),
                    BtnPrimary(
                      title: 'Đăng ký',
                      cb_press: () => {
                        _signUp(emailController.text, passwordController.text,
                            firstNameController.text, _role.toString())
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => ({
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignInWidget()))
                          }),
                          child: RichText(
                            text: TextSpan(
                              text: 'Bạn đã có tài khoản?  ',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                              children: [
                                TextSpan(
                                    text: 'Đăng nhập',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  void _signUp(
      String email, String password, String firstName, String role) async {
    final authRepository = AuthenticationRepository();

    final result = await authRepository.signUpWithEmailAndPassword(
        email: email, password: password);
    authRepository.putEmailToFireStore(role.t);
    if (result) {
      // ignore: use_build_context_synchronously
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }
}
