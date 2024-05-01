import 'package:chatapp/auth/auth_service.dart';
import 'package:chatapp/components/title_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TitleBar(header: "Home", actions: [
      IconButton(
          onPressed: logout,
          icon: Icon(Icons.logout,
              color: Theme.of(context).colorScheme.inversePrimary)),
    ]));
  }
}
