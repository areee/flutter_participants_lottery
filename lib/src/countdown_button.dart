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
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyText2,
            )));
  }
}
