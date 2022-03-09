import 'package:flutter/material.dart';

class CountdownButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const CountdownButton(this.title, this.onPressed, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
            )));
  }
}
