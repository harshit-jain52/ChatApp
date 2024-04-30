import 'package:chatapp/components/input_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              Icon(
                Icons.chat,
                size: 70,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 20),
              Text("Log In to start Chatting",
                  style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.inversePrimary)),
              const SizedBox(height: 20),
              const InputField(
                placeholder: 'Username',
              ),
              const SizedBox(height: 10),
              const InputField(
                placeholder: 'Password',
                obscure: true,
              ),
            ],
          ),
        ));
  }
}
