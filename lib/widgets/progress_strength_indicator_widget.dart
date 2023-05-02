import 'package:flutter/material.dart';

class PasswordStrengthIndicatorWidget extends StatelessWidget {
  const PasswordStrengthIndicatorWidget({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              shape: BoxShape.circle,
              color: Colors.green),
          child: Center(
              child: Icon(
            Icons.check,
            color: Colors.white,
            size: 18,
          )),
        ),
        SizedBox(
          width: 8,
        ),
        Text(message)
      ],
    );
  }
}
