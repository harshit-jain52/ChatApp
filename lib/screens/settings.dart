import 'package:chatapp/components/title_bar.dart';
import 'package:chatapp/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider.notifier);
    return Scaffold(
      appBar: const TitleBar(header: "Settings"),
      body: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Dark Theme",
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            CupertinoSwitch(
              value: theme.isDarkMode,
              onChanged: (value) => theme.toggleTheme(),
            ),
          ],
        ),
      ),
    );
  }
}
