import 'package:e_commerce_flower/constants.dart';
import 'package:e_commerce_flower/providers/progress_indicator_provider.dart';
import 'package:e_commerce_flower/widgets/custom_button.dart';
import 'package:e_commerce_flower/widgets/custom_snack_bar.dart';
import 'package:e_commerce_flower/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        title: const Text(
          "Reset password",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Text(
                    "Enter your email to reset password",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 12,
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
                    suffixIcon: Icon(Icons.email),
                    isObscured: false,
                    hintText: "Enter your email",
                    keyBoardType: TextInputType.emailAddress,
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

                            classInstance.changeProgressIndicator();
                          } else {
                            showSnackBar(
                                bgColor: Colors.red,
                                snackBarMessage:
                                    "Can't validate entered either email or password",
                                context: context);
                          }
                        },
                        bgColor: greenColor,
                        buttonText: "Reset password");
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
