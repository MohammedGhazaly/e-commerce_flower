import 'package:e_commerce_flower/constants.dart';
import 'package:e_commerce_flower/shared/custom_button.dart';
import 'package:e_commerce_flower/shared/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 64,
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
              buttonText: "Sign in",
            )
          ],
        ),
      ),
    );
  }
}
