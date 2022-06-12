import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doctorcare/widget/base/TextFieldPrimary.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    emailController =
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
                      'Welcome.',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const Text(
                      'Meet doctors with a simple touch',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldPrimary(
                      title: 'Email',
                      textController: emailController,
                      validator: emailValidator,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFieldPrimary(
                      title: 'Password',
                      isPassword: true,
                      textController: passwordController,
                      validator: passwordValidator,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFieldPrimary(
                      title: 'Fullname',
                      textController: firstNameController,
                      validator: firstNameValidator,
                    ),
                    SizedBox(
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
                            Expanded(
                              child: Text('Patient'),
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
                            Expanded(
                              child: Text(
                                'Doctor',
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
                      title: 'Sign Up',
                      cb_press: () => {
                        signUp(emailController.text, passwordController.text,
                            firstNameController.text)
                      },
                    ),
                    SizedBox(
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
                                    builder: (context) => const SignUpScreen()))
                          }),
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account?  ',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                              children: [
                                TextSpan(
                                    text: 'Login',
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
}
