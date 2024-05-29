import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/button.dart';
import 'package:chatapp/components/input_field.dart';
import 'package:chatapp/components/title_bar.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // Text Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final void Function()? goToRegister;

  LoginPage({super.key, this.goToRegister});

  // Methods
  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signIn(_emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const TitleBar(header: "Flutter Chat App"),
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
                placeholder: 'Email',
                inputController: _emailController,
              ),

              const SizedBox(height: 10),

              InputField(
                placeholder: 'Password',
                obscure: true,
                inputController: _passwordController,
              ),

              const SizedBox(height: 20),

              Button(buttonText: "Log In", onTap: () => login(context)),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary)),
                  GestureDetector(
                    onTap: goToRegister,
                    child: Text("Sign Up",
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
