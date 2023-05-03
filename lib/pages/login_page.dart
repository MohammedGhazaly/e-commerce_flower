import 'package:e_commerce_flower/constants.dart';
import 'package:e_commerce_flower/pages/home_page.dart';
import 'package:e_commerce_flower/pages/register_page.dart';
import 'package:e_commerce_flower/providers/progress_indicator_provider.dart';
import 'package:e_commerce_flower/widgets/custom_button.dart';
import 'package:e_commerce_flower/widgets/custom_snack_bar.dart';
import 'package:e_commerce_flower/widgets/custom_text_button.dart';
import 'package:e_commerce_flower/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String email = "";
  String password = "";
  final formKey = GlobalKey<FormState>();

  logIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (!mounted) {
        return;
      }
      showSnackBar(
          bgColor: Colors.green,
          snackBarMessage: "Welcome back.",
          context: context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(
            bgColor: Colors.red,
            snackBarMessage: "No user found for that email.",
            context: context);
      } else if (e.code == 'wrong-password') {
        showSnackBar(
            bgColor: Colors.red,
            snackBarMessage: "Wrong password provided for that user.",
            context: context);
      }
    }
  }

  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: 64,
                  // ),
                  CustomTextField(
                    textEditingController: emailController,
                    hintText: "Enter your email: ",
                    isObscured: false,
                    keyBoardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextField(
                    textEditingController: passwordController,
                    hintText: "Enter your password: ",
                    isObscured: true,
                    keyBoardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Consumer<ProgressIndicatorProvider>(
                      builder: (context, classInstance, child) {
                    return CustomButton(
                      isRegistering: classInstance.isLoading,
                      pressedFunction: () async {
                        classInstance.changeProgressIndicator();
                        await logIn();
                        classInstance.changeProgressIndicator();
                      },
                      bgColor: greenColor,
                      buttonText: "Sign in",
                    );
                  }),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 16),
                      ),

                      // SizedBox(
                      //   width: 8,
                      // ),
                      CustomTextButton(
                          text: "Sign up",
                          onPressedFunction: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => RegisterPage()));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
