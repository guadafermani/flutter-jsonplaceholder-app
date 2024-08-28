import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.lock_open,
          size: 100,
          color: Colors.grey[600],
        ),
        const SizedBox(height: 20),
        Text(
          "Welcome back!",
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
