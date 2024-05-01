import 'package:chatapp/services/auth/auth_gate.dart';
import 'package:chatapp/themes/dark_mode.dart';
// import 'package:chatapp/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    home: const AuthGate(),
    theme: darkMode,
    debugShowCheckedModeBanner: false,
  ));
}
