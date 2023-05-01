import 'package:e_commerce_flower/constants.dart';
import 'package:e_commerce_flower/pages/login_page.dart';
import 'package:e_commerce_flower/providers/progress_indicator.dart';
import 'package:e_commerce_flower/widgets/custom_button.dart';
import 'package:e_commerce_flower/widgets/custom_text_button.dart';
import 'package:e_commerce_flower/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final String email = "";

  final String password = "";

  register() async {
    try {
      final credintial = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("The password provided is weak");
      } else if (e.code == "email-already-in-use") {
        print("The account already exists");
      }
    }
  }

  @override
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
                  const CustomTextField(
                    hintText: "Enter your username: ",
                    isObscured: false,
                    keyBoardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
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
                        await register();
                        classInstance.changeProgressIndicator();

                        // classInstance.changeProgressIndicator();
                      },
                      bgColor: greenColor,
                      buttonText: "Register",
                    );
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 16),
                      ),

                      // SizedBox(
                      //   width: 8,
                      // ),
                      CustomTextButton(
                          text: "Sign in",
                          onPressedFunction: () {
                            // Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
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
