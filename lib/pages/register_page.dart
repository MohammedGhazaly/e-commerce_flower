import 'package:e_commerce_flower/constants.dart';
import 'package:e_commerce_flower/pages/login_page.dart';
import 'package:e_commerce_flower/widgets/custom_button.dart';
import 'package:e_commerce_flower/widgets/custom_text_button.dart';
import 'package:e_commerce_flower/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                    hintText: "Enter your username: ",
                    isObscured: false,
                    keyBoardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomTextField(
                    hintText: "Enter your email: ",
                    isObscured: false,
                    keyBoardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomTextField(
                    hintText: "Enter your password: ",
                    isObscured: true,
                    keyBoardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomButton(
                    bgColor: greenColor,
                    buttonText: "Register",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
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
                  SizedBox(
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
