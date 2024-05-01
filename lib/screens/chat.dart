import 'package:chatapp/components/title_bar.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;
  ChatScreen({
    super.key,
    required this.receiverEmail,
    required this.receiverID,
  });

  final TextEditingController _messageController = TextEditingController();

  // chat & auth services
  final AuthService _authService = AuthService();
  final ChatService _chatService = ChatService();

  void sendMessage() async {
    if (_messageController.text.isEmpty) return;

    await _chatService.sendMessage(
      receiverID,
      _messageController.text,
    );

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(header: receiverEmail),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildUserInput(context),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(senderID, receiverID),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return const Text("Error");
        }

        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        // data: list view
        return ListView(
          children: snapshot.data!.docs
              .map((doc) => _buildMessageItem(doc, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc, BuildContext context) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isSender = data["senderID"] == _authService.getCurrentUser()!.uid;
    final timestamp = (data['timestamp'] as Timestamp).toDate();

    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          margin: isSender
              ? const EdgeInsets.only(left: 100, right: 5, top: 5, bottom: 5)
              : const EdgeInsets.only(left: 5, right: 100, top: 5, bottom: 5),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSender
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            data["message"],
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            DateFormat('hh:mm a').format(timestamp), // Display timestamp
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildUserInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              decoration: InputDecoration(
                hintText: "Type a message...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: sendMessage,
            icon: Icon(
              Icons.send,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
