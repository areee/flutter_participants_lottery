import 'package:about/about.dart';
import 'package:flutter/material.dart';
import 'package:flutter_participants_lottery/pubspec.dart';
import 'package:url_launcher/url_launcher.dart';

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
          'Versio {{ version }}, koontiversio {{ buildNumber }}',
      applicationDescription: const Text(
        Pubspec.description,
        textAlign: TextAlign.justify,
      ),
      applicationLegalese: 'Copyright © {{ author }}, {{ year }}',
      children: <Widget>[
        ListTile(
          title: const Text('Lähdekoodi'),
          subtitle: const Text('GitHub'),
          leading: const Icon(Icons.code),
          onTap: _launchURL,
        ),
        const MarkdownPageListTile(
          filename: 'LICENSE.md',
          title: Text('Näytä lisenssitiedosto'),
          icon: Icon(Icons.description),
        ),
        const LicensesPageListTile(
          title: Text('Avoimen lähdekoodin lisenssit'),
          icon: Icon(Icons.favorite),
        ),
      ],
    );
  }

  Future<void> _launchURL() async {
    final uri = Uri.parse(Pubspec.repository);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
