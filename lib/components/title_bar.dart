import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  final String header;
  final List<Widget>? actions;
  const TitleBar({super.key, required this.header, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(header),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight); // kToolbarHeight is the default AppBar height
}
