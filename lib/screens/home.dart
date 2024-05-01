import 'package:chatapp/components/user_tile.dart';
import 'package:chatapp/screens/chat.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/title_bar.dart';
import 'package:chatapp/screens/settings.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  Home({super.key});

  // services
  final AuthService _authService = AuthService();
  final ChatService _chatService = ChatService();

  void logout() {
    _authService.signOut();
  }

  void launchURL() async {
    final Uri url = Uri.parse("https://github.com/harshit-jain52/ChatApp");
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(header: "Home", actions: [
        IconButton(
            onPressed: launchURL,
            icon: Icon(Icons.info_outline_rounded,
                color: Theme.of(context).colorScheme.inversePrimary)),
      ]),
      drawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      children: [
                        Icon(
                          Icons.chat,
                          size: 60,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Text(
                          "Flutter Chat App",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      title: Text("HOME",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 20,
                            letterSpacing: 1.5,
                          )),
                      leading: Icon(Icons.home,
                          color: Theme.of(context).colorScheme.primary),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      title: Text("SETTINGS",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 20,
                            letterSpacing: 1.5,
                          )),
                      leading: Icon(Icons.settings,
                          color: Theme.of(context).colorScheme.primary),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Settings()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
                child: ListTile(
                  title: Text("LOG OUT",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20,
                        letterSpacing: 1.5,
                      )),
                  leading: Icon(Icons.logout,
                      color: Theme.of(context).colorScheme.primary),
                  onTap: logout,
                ),
              ),
            ],
          )),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsers(),
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
          padding: const EdgeInsets.all(10),
          children: snapshot.data!
              .where((element) =>
                  element["email"] != _authService.getCurrentUser()!.email)
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    return UserTile(
      name: userData["email"],
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              receiverEmail: userData["email"],
              receiverID: userData["uid"],
            ),
          ),
        );
      },
    );
  }
}
