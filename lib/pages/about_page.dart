import 'package:about/about.dart';
import 'package:flutter/material.dart';
import 'package:flutter_participants_lottery/pubspec.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return AboutPage(
      values: {
        'version': Pubspec.version,
        'buildNumber': Pubspec.versionBuild.toString(),
        'year': DateTime.now().year.toString(),
        'author': Pubspec.authorsName.join(', '),
      },
      title: const Text('Tietoja sovelluksesta'),
      applicationVersion:
          'Versio {{ version }}, koontiversio #{{ buildNumber }}',
      applicationDescription: const Text(
        Pubspec.description,
        textAlign: TextAlign.justify,
      ),
      // applicationIcon: const Image(
      //   image: AssetImage('assets/icon.png'),
      //   width: 100,
      //   height: 100,
      // ),
      applicationLegalese: 'Copyright © {{ author }}, {{ year }}',
      children: const <Widget>[
        // MarkdownPageListTile(
        //   filename: 'README.md',
        //   title: Text('Näytä readme-tiedosto'),
        //   icon: Icon(Icons.all_inclusive),
        // ),
        MarkdownPageListTile(
          filename: 'LICENSE.md',
          title: Text('Näytä lisenssitiedosto'),
          icon: Icon(Icons.description),
        ),
        LicensesPageListTile(
          title: Text('Avoimen lähdekoodin lisenssit'),
          icon: Icon(Icons.favorite),
        ),
      ],
    );
  }
}
