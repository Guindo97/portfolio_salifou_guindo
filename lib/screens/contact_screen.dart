import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/navbar.dart';
import '../utils/cv_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  void _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'salifouguindo7@gmail.com',
      queryParameters: {'subject': 'Contact via Portfolio'},
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Me contacter"),
        backgroundColor: Colors.purple.shade700, // Barre d'app en mauve foncé
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple.shade100, // Mauve clair
              Colors.white, // Blanc
              Colors.greenAccent.shade100, // Vert clair
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: const Icon(Icons.email, color: Colors.blue),
                title: const Text(
                  "salifouguindo7@gmail.com",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onTap: _sendEmail,
              ),
              ListTile(
                leading: const Icon(Icons.download, color: Colors.blue),
                title: const Text(
                  "Télécharger mon CV",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onTap: () => CVLauncher.openGitHubCV(context),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent.shade400, // Vert clair
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Arrondi du bouton
                  ),
                ),
                onPressed: _sendEmail,
                child: const Text("M'envoyer un Email", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Navbar(currentIndex: 3),
    );
  }
}
