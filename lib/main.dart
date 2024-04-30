import 'package:chatapp/screens/login.dart';
import 'package:chatapp/themes/dark_mode.dart';
// import 'package:chatapp/themes/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const LoginPage(),
    theme: darkMode,
  ));
}
