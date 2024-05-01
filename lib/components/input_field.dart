import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String placeholder;
  final bool obscure;
  final TextEditingController inputController;
  const InputField(
      {super.key,
      required this.placeholder,
      this.obscure = false,
      required this.inputController});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
            controller: inputController,
            obscureText: obscure,
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
            cursorColor: Theme.of(context).colorScheme.inversePrimary,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.tertiary)),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              fillColor: Theme.of(context).colorScheme.secondary,
              filled: true,
              hintText: placeholder,
              hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            )));
  }
}
