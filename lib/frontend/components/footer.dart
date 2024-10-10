import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  Future<void> _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) throw 'Não foi possível abrir $url';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Contatos',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.code),
              onPressed: () => _launchURL('https://github.com/LucasFelip'),
              tooltip: 'GitHub',
            ),
            IconButton(
              icon: const Icon(Icons.link),
              onPressed: () => _launchURL('https://www.linkedin.com/in/lucas-reis-5247b1221/'),
              tooltip: 'LinkedIn',
            ),
          ],
        ),
        const Divider(),
        const Text(
          '© 2024 Lucas Ferreira',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
