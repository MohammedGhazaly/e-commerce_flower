import 'package:flutter/material.dart';

class PasswordStrengthIndicatorWidget extends StatelessWidget {
  const PasswordStrengthIndicatorWidget({
    super.key,
    required this.message,
    required this.isSatisfied,
  });
  final String message;
  final bool isSatisfied;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              // border: Border.all(color: Colors.grey.shade400),
              shape: BoxShape.circle,
              color: isSatisfied == true ? Colors.green : Colors.red),
          child: Center(
              child: Icon(
            isSatisfied == true ? Icons.check : Icons.close,
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
