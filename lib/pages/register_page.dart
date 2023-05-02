import 'package:e_commerce_flower/constants.dart';
import 'package:e_commerce_flower/pages/login_page.dart';
import 'package:e_commerce_flower/providers/progress_indicator.dart';
import 'package:e_commerce_flower/widgets/custom_button.dart';
import 'package:e_commerce_flower/widgets/custom_snack_bar.dart';
import 'package:e_commerce_flower/widgets/custom_text_button.dart';
import 'package:e_commerce_flower/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

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
  final formKey = GlobalKey<FormState>();
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
              child: Form(
                key: formKey,
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validatorFunction: (value) {
                        return value != null && !EmailValidator.validate(value)
                            ? "Enter a valid email"
                            : null;
                      },
                      textEditingController: emailController,
                      hintText: "Enter your email: ",
                      isObscured: false,
                      keyBoardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validatorFunction: (value) {
                        if (value!.length < 8) {
                          return "Enter at least 8 characters";
                        } else {
                          return null;
                        }
                      },
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
                          if (formKey.currentState!.validate()) {
                            classInstance.changeProgressIndicator();
                            await register();
                            classInstance.changeProgressIndicator();
                          } else {
                            showSnackBar(
                                bgColor: Colors.red,
                                snackBarMessage:
                                    "Can't validate entered either email or password",
                                context: context);
                          }

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
      ),
    );
  }

  register() async {
    try {
      final credintial = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      showSnackBar(
          bgColor: Colors.green,
          snackBarMessage: "Email registered successfully",
          context: context);
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        showSnackBar(
            context: context,
            bgColor: Colors.red,
            snackBarMessage: "The password is weak");
      } else if (e.code == "email-already-in-use") {
        showSnackBar(
            context: context,
            bgColor: Colors.red,
            snackBarMessage: "The email is already in use");
      }
    }
  }
}
