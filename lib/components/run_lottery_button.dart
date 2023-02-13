import 'package:flutter/material.dart';

class RunLotteryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final int participantsCount;

  const RunLotteryButton(this.onPressed, this.participantsCount, {Key? key})
      : super(key: key);

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
        'Arvo ($participantsCount kpl)',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
