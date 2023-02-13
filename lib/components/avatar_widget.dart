import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class AvatarWidget extends StatelessWidget {
  final String name;

  const AvatarWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RandomAvatar(name, width: 50, height: 50),
        Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
