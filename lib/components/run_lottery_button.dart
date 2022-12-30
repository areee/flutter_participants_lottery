import 'package:flutter/material.dart';

class RunLotteryButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const RunLotteryButton(this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(
        Icons.shuffle,
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      label: Text(
        'Arvo',
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
