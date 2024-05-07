import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'functions/build_email_validation.dart';
import 'functions/build_password_validation.dart';
import 'functions/build_sign_up.dart';
import 'login_screen.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenUIState();
}

class _LoginScreenUIState extends State<RegisterScreen> {
  bool rememberMe = false;

  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;


  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final scaffoldDecoration = const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color(0xFF73AEF5),
        Color(0xFF61A4F1),
        Color(0xFF478DE0),
        Color(0xFF398AE5),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: scaffoldDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 120,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Sign Up ',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    defaultSizedBox(),
                    CustomTextFormField(
                      controller: nameController,
                      autoValidateMode: autoValidateMode,
                      labelText: 'Full Name',
                      hintText: 'Enter Your Name ',
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Name required';
                        } else {
                          return null;
                        }
                      },
                    ),
                    defaultSizedBox(),
                    CustomTextFormField(
                      controller: phoneController,
                      autoValidateMode: autoValidateMode,
                      labelText: 'Phone No',
                      hintText: 'Enter Your Phone ',
                      prefixIcon: Icons.phone,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Phone required';
                        } else {
                          return null;
                        }
                      },
                    ),
                    defaultSizedBox(),
                    CustomTextFormField(
                      labelText: 'Email',
                      hintText: 'Enter Your Email ',
                      prefixIcon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      autoValidateMode: autoValidateMode,
                      validator: (value) {
                        return buildEmailValidation(value);
                      },
                    ),
                    defaultSizedBox(),
                    CustomTextFormField(
                      controller: passwordController,
                      labelText: 'Password',
                      hintText: 'Enter Your Password ',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      autoValidateMode: autoValidateMode,
                      validator: (value) {
                        return buildPasswordValidation(value);
                      },
                    ),
                    defaultSizedBox(),
                    CustomButton(
                      text: 'Register',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          UserCredential user = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        } else {
                          autoValidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    ),
                    defaultSizedBox(),
                    buildHaveAccount(
                      context,
                      haveAnAccount: 'Have an account ? ',
                      signInOrUp: ' Sign In ',
                      page: const LoginScreen(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRememberMeCheckBox() => Row(
        children: [
          Checkbox(
            value: rememberMe,
            activeColor: Colors.white,
            onChanged: (_) {
              setState(() {
                rememberMe = !rememberMe;
              });
            },
          ),
          const Text('Remember Me ', style: kLabelStyle),
        ],
      );
}
