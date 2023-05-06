import 'package:e_commerce_flower/constants.dart';
import 'package:e_commerce_flower/main.dart';
import 'package:e_commerce_flower/pages/login_page.dart';
import 'package:e_commerce_flower/providers/progress_indicator_provider.dart';
import 'package:e_commerce_flower/providers/toggle_password_provider.dart';
import 'package:e_commerce_flower/widgets/custom_button.dart';
import 'package:e_commerce_flower/widgets/custom_snack_bar.dart';
import 'package:e_commerce_flower/widgets/custom_text_button.dart';
import 'package:e_commerce_flower/widgets/custom_text_field.dart';
import 'package:e_commerce_flower/widgets/progress_strength_indicator_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final String email = "";

  String password = "";
  final formKey = GlobalKey<FormState>();
  // Variables for passwordChanged
  bool isPasswordEightChar = false;
  bool hasUpperCase = false;
  bool hasDigits = false;
  bool hasLowerCase = false;
  bool hasSpecialCharacters = false;
  onPasswordChanged({required password}) {
    isPasswordEightChar = false;
    hasUpperCase = false;
    hasDigits = false;
    hasLowerCase = false;
    hasSpecialCharacters = false;
    setState(() {
      if (password.contains(RegExp(r".{8,}"))) {
        isPasswordEightChar = true;
      }
      if (password.contains(RegExp(r'[A-Z]'))) {
        hasUpperCase = true;
      }
      if (password.contains(RegExp(r'[0-9]'))) {
        hasDigits = true;
      }
      if (password.contains(RegExp(r'[a-z]'))) {
        hasLowerCase = true;
      }
      if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        hasSpecialCharacters = true;
      }
    });
  }

  register() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (!mounted) {
        return;
      }
      showSnackBar(
          bgColor: Colors.green,
          snackBarMessage: "Email registered successfully",
          context: context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => App()));
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
                    SizedBox(
                      height: 32,
                    ),
                    const CustomTextField(
                      hintText: "Enter your username: ",
                      isObscured: false,
                      keyBoardType: TextInputType.text,
                      suffixIcon: Icon(Icons.person),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validatorFunction: (value) {
                        // return value != null && !EmailValidator.validate(value)
                        //     ? "Enter a valid email"
                        //     : null;
                        return value != null &&
                                !value.contains(RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                            ? "Enter a valid email"
                            : null;
                      },
                      textEditingController: emailController,
                      hintText: "Enter your email: ",
                      isObscured: false,
                      keyBoardType: TextInputType.emailAddress,
                      suffixIcon: const Icon(Icons.email),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Consumer<TogglePasswordProvider>(
                        builder: (context, classInstance, child) {
                      return CustomTextField(
                        onChangedFunction: (value) {
                          onPasswordChanged(password: value);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validatorFunction: (value) {
                          if (!isPasswordEightChar ||
                              !hasUpperCase ||
                              !hasDigits ||
                              !hasLowerCase ||
                              !hasSpecialCharacters) {
                            return "Satisfy the criteria below";
                          } else {
                            return null;
                          }
                        },
                        textEditingController: passwordController,
                        hintText: "Enter your password: ",
                        isObscured: classInstance.isObscured,
                        keyBoardType: TextInputType.text,
                        suffixIcon: classInstance.isObscured == true
                            ? IconButton(
                                onPressed: () {
                                  classInstance.togglePassword(
                                      isObscuredValue: false);
                                },
                                icon: const Icon(Icons.visibility))
                            : IconButton(
                                onPressed: () {
                                  classInstance.togglePassword(
                                      isObscuredValue: true);
                                },
                                icon: const Icon(Icons.visibility_off)),
                      );
                    }),
                    const SizedBox(
                      height: 24,
                    ),
                    PasswordStrengthIndicatorWidget(
                        isSatisfied: isPasswordEightChar,
                        message: "At least 8 characters"),
                    const SizedBox(
                      height: 16,
                    ),
                    PasswordStrengthIndicatorWidget(
                        isSatisfied: hasDigits, message: "At least 1 number"),
                    const SizedBox(
                      height: 16,
                    ),
                    PasswordStrengthIndicatorWidget(
                        isSatisfied: hasUpperCase, message: "Has uppercase"),
                    const SizedBox(
                      height: 16,
                    ),
                    PasswordStrengthIndicatorWidget(
                        isSatisfied: hasLowerCase, message: "Has lowercase"),
                    const SizedBox(
                      height: 16,
                    ),
                    PasswordStrengthIndicatorWidget(
                        isSatisfied: hasSpecialCharacters,
                        message: "Has a special characters"),
                    const SizedBox(
                      height: 12,
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
                    const SizedBox(
                      height: 12,
                    ),

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
                                      builder: (context) => const LoginPage()));
                            }),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 24,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
