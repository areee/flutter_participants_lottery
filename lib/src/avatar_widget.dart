import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AvatarWidget extends StatelessWidget {
  final String participantName;

  const AvatarWidget({Key? key, required this.participantName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Column(
        children: [
          Image.network(
            'https://api.multiavatar.com/$participantName.png?apikey=${dotenv.env['MULTIAVATAR_API_KEY']}',
            height: 50,
          ),
          Text('$participantName')
        ],
      ),
    );
  }
}
