import 'package:flutter/material.dart';
import 'widgets/login_button.dart';
import 'widgets/login_forgot_password.dart';
import 'widgets/login_header.dart';
import 'widgets/login_other_methods.dart';
import 'widgets/login_textfield.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const LoginHeader(),
              const SizedBox(height: 40),
              LoginTextfield(
                labelText: 'Email',
                controller: _emailController,
              ),
              LoginTextfield(
                labelText: 'Password',
                controller: _passwordController,
                obscureText: true,
              ),
              const LoginForgotPassword(),
              const SizedBox(height: 20),
              LoginButton(
                context,
                emailController: _emailController,
                passwordController: _passwordController,
              ),
              const SizedBox(height: 20),
              const LoginOtherMethods()
            ],
          ),
        ),
      ),
    );
  }
}
