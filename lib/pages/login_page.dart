import 'package:e_commerce_flower/constants.dart';
import 'package:e_commerce_flower/pages/home_page.dart';
import 'package:e_commerce_flower/providers/googe_signin.dart';
import 'package:e_commerce_flower/providers/progress_indicator_provider.dart';
import 'package:e_commerce_flower/providers/toggle_password_provider.dart';
import 'package:e_commerce_flower/widgets/custom_button.dart';
import 'package:e_commerce_flower/widgets/custom_snack_bar.dart';
import 'package:e_commerce_flower/widgets/custom_text_button.dart';
import 'package:e_commerce_flower/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (!mounted) {
        return;
      }
      showSnackBar(
          bgColor: Colors.green,
          snackBarMessage: "Welcome back.",
          context: context);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => const HomePage()));
      Navigator.pushNamed(context, "/homePage");
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
      } else {
        showSnackBar(
            bgColor: Colors.red,
            snackBarMessage: "Check email and password again.",
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
                  SizedBox(
                    height: 32,
                  ),
                  CustomTextField(
                    suffixIcon: Icon(Icons.email),
                    textEditingController: emailController,
                    hintText: "Enter your email: ",
                    isObscured: false,
                    keyBoardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Consumer<TogglePasswordProvider>(
                      builder: (context, classInstance, child) {
                    return CustomTextField(
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
                  CustomTextButton(
                      text: "Forgot password?",
                      onPressedFunction: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => RegisterPage()));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ForgotPasswordPage()));
                        Navigator.pushNamed(context, "/forgetPassword");
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
                            Navigator.pushNamed(context, "/registerPage");
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.8,
                  //   child: const Row(
                  //     children: [
                  //       Expanded(
                  //           child: Divider(
                  //         thickness: 1,
                  //       )),
                  //       SizedBox(
                  //         width: 10,
                  //       ),
                  //       Text(
                  //         "OR",
                  //         style: TextStyle(fontSize: 18),
                  //       ),
                  //       SizedBox(
                  //         width: 10,
                  //       ),
                  //       Expanded(
                  //           child: Divider(
                  //         thickness: 1,
                  //       )),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 18,
                  // ),
                  // Text(
                  //   "Sign in with:",
                  //   style: TextStyle(fontSize: 22),
                  // ),
                  // SizedBox(
                  //   height: 12,
                  // ),
                  // Consumer<GoogleSignInProvider>(
                  //     builder: (context, googleProviderInstance, child) {
                  //   return Container(
                  //       // margin: EdgeInsets.symmetric(vertical: 27),
                  //       child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       GestureDetector(
                  //         onTap: () async {
                  //           await googleProviderInstance.googlelogin();

                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => HomePage()));
                  //         },
                  //         // child: Container(
                  //         //   padding: EdgeInsets.all(10),
                  //         //   decoration: BoxDecoration(
                  //         //       shape: BoxShape.circle,
                  //         //       border:
                  //         //           Border.all(color: Colors.red, width: 3)),
                  //         //   child: SvgPicture.asset(
                  //         //     width: 40,
                  //         //     "assets/icons/google.svg",
                  //         //     color: Colors.red,
                  //         //     height: 40,
                  //         //   ),
                  //         // ),
                  //       )
                  //     ],
                  //   ));
                  // })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
