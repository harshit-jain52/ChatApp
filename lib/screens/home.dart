import 'package:chatapp/auth/auth_service.dart';
import 'package:chatapp/components/title_bar.dart';
import 'package:chatapp/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
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
    );
  }
}
