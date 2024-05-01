import 'package:chatapp/components/button.dart';
import 'package:chatapp/components/input_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // Text Controllers
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  // Methods
  void login() {
    // print('clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text('Flutter ChatApp'),
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(
              //   Icons.chat,
              //   size: 70,
              //   color: Theme.of(context).colorScheme.primary,
              // ),
              Image.asset(
                'assets/img/chatapp_logo.png',
                width: 90,
              ),

              const SizedBox(height: 20),

              Text("Welcome Back",
                  style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.inversePrimary)),

              const SizedBox(height: 20),

              InputField(
                placeholder: 'Username',
                inputController: _usernameController,
              ),

              const SizedBox(height: 10),

              InputField(
                placeholder: 'Password',
                obscure: true,
                inputController: _passwordController,
              ),

              const SizedBox(height: 20),

              Button(buttonText: "Log In", onTap: login),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary)),
                  Text("Sign Up",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ));
  }
}
