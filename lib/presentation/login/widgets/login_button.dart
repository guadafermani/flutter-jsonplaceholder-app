import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class LoginButton extends StatelessWidget {
  final BuildContext context;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton(this.context,
      {super.key,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          final authProvider =
              Provider.of<AuthProvider>(context, listen: false);
          authProvider.login(
            emailController.text,
            passwordController.text,
          );
          if (authProvider.isAuthenticated) {
            Navigator.pushReplacementNamed(context, '/posts');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Invalid credentials')),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
