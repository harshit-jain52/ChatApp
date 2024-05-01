import 'package:chatapp/components/button.dart';
import 'package:chatapp/components/input_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  // Text Controllers
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpwdController = TextEditingController();

  RegisterPage({super.key});

  // Methods
  void register() {
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

              Text("Register to start Chatting",
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

              const SizedBox(height: 10),

              InputField(
                placeholder: 'Confirm Password',
                obscure: true,
                inputController: _confirmpwdController,
              ),

              const SizedBox(height: 20),

              Button(buttonText: "Register", onTap: register),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary)),
                  Text("Log In",
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
