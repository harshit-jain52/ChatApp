import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String name;
  final void Function()? onTap;

  const UserTile({super.key, required this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Icon(Icons.person,
                color: Theme.of(context).colorScheme.inversePrimary),
            const SizedBox(width: 20),
            Text(
              name,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
