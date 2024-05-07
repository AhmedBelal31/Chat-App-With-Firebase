import 'package:chat_app/presentation/screens/functions/build_password_validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'functions/build_email_validation.dart';
import 'functions/build_forget_password.dart';
import 'functions/build_sign_in_with_text.dart';
import 'functions/build_sign_up.dart';
import 'register_screen.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/social_media_icons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  final scaffoldDecoration = const BoxDecoration(
    gradient: LinearGradient(colors: [
      Color(0xFF73AEF5),
      Color(0xFF61A4F1),
      Color(0xFF478DE0),
      Color(0xFF398AE5),
    ]),
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
                        'Sign In ',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    defaultSizedBox(),
                    CustomTextFormField(
                      controller: emailController,
                      autoValidateMode: autoValidateMode,
                      validator: (value) {
                        return buildEmailValidation(value);
                      },
                      labelText: 'Email',
                      hintText: 'Enter Your Email ',
                      prefixIcon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    defaultSizedBox(),
                    CustomTextFormField(
                      controller: passwordController,
                      autoValidateMode: autoValidateMode,
                      validator: (value) {
                        return buildPasswordValidation(value);
                      },
                      labelText: 'Password',
                      hintText: 'Enter Your Password ',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    buildForgetPassword(),
                    buildRememberMeCheckBox(),
                    const SizedBox(height: 15),
                    CustomButton(
                      text: 'LOGIN',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          var user = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        } else {
                          setState(() {
                            autoValidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                    ),
                    defaultSizedBox(height: 15),
                    buildSignInWithText(),
                    defaultSizedBox(),
                    const SocialMediaIcons(),
                    defaultSizedBox(),
                    buildHaveAccount(
                      context,
                      haveAnAccount: 'Don\'t have an account ? ',
                      signInOrUp: ' Sign Up ',
                      page: const RegisterScreen(),
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













