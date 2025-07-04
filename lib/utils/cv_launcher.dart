import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CVLauncher {
  static void openGitHubCV(BuildContext context) async {
    final Uri url = Uri.parse("https://github.com/Guindo97/cv");

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Impossible d'ouvrir le lien du CV")),
      );
    }
  }
}
