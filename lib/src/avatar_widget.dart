import 'package:flutter/material.dart';
import '../env/env.dart';

class AvatarWidget extends StatelessWidget {
  final String participantName;

  const AvatarWidget({Key? key, required this.participantName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Image.network(
            'https://api.multiavatar.com/$participantName.png?apikey=${Env.multiavatar}',
            height: 50,
          ),
          Text(participantName)
        ],
      ),
    );
  }
}
