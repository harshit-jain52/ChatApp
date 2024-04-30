import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter ChatApp'),
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          backgroundColor: Colors.indigo.shade400,
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Start Chatting!'),
        ));
  }
}
