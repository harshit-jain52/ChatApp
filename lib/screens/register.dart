import 'package:chatapp/components/button.dart';
import 'package:chatapp/components/input_field.dart';
import 'package:chatapp/components/title_bar.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  // Text Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpwdController = TextEditingController();

  final void Function()? goToLogin;

  RegisterPage({super.key, this.goToLogin});

  // Methods
  void register() {
    // print('clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: TitleBar(header: "Flutter Chat App"),
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
                placeholder: 'Email',
                inputController: _emailController,
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
                  GestureDetector(
                    onTap: goToLogin,
                    child: Text("Log In",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
