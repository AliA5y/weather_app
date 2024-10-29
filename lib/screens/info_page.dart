import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            color: Colors.teal.withOpacity(0.5),
            child: ListTile(
              onTap: () {},
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              title: const Text('App Developer'),
              subtitle: const Text(
                'Ali Al-Zaidy',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextButton(
              onPressed: () {
                String link = 'AliA5y';
                final Uri url =
                    Uri(scheme: 'https', host: 'github.com', path: link);
                launchAUrl(url);
              },
              child: const Text(
                "Github",
                style: TextStyle(color: Colors.purple),
              )),
          const SizedBox(
            height: 16,
          ),
          TextButton(
              onPressed: () {
                String link =
                    'https://www.linkedin.com/in/ali-al-zaidy-00502630a';
                final Uri url = Uri.parse(link);
                launchAUrl(url);
              },
              child: const Text(
                "LinkedIn",
                style: TextStyle(color: Colors.blue),
              )),
          const SizedBox(
            height: 16,
          ),
          TextButton(
              onPressed: () {
                String link = '+967779085571';
                final Uri url = Uri(scheme: 'https', host: 'wa.me', path: link);
                launchAUrl(url);
              },
              child: const Text(
                "WhatsApp",
                style: TextStyle(color: Colors.green),
              ))
        ],
      ),
    );
  }
}

void launchAUrl(Uri url) async {
  try {
    if (await launchUrl(url)) {
    } else {
      throw 'did not launch $url';
    }
  } catch (e) {
    throw 'Could not launch $url, ${e.toString()}';
  }
}
