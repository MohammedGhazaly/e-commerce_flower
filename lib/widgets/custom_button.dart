import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.bgColor,
      required this.buttonText,
      this.pressedFunction,
      this.isRegistering});
  final Color bgColor;
  final String buttonText;
  final void Function()? pressedFunction;
  final bool? isRegistering;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressedFunction,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(bgColor),
        padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
      child: isRegistering == false
          ? Text(
              buttonText,
              style: TextStyle(fontSize: 19),
            )
          : LoadingAnimationWidget.twoRotatingArc(
              color: Colors.white, size: 20),
    );
  }
}
