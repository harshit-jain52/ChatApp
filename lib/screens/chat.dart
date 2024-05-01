import 'package:chatapp/components/title_bar.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String receiverEmail;
  const ChatScreen({super.key, required this.receiverEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(header: receiverEmail),
    );
  }
}
