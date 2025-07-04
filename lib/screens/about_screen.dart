import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_salifou_guindo/utils/cv_launcher.dart';
import '../widgets/navbar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("À propos de moi"),
        backgroundColor: Colors.purple.shade700, // Barre d'app en mauve foncé
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple.shade100, // Fond violet clair
              Colors.white, // Fond blanc
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('../../ios/assets/salif.jpg'),
              ),
              const SizedBox(height: 20),
              Text(
                "Salifou Guindo",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                "Développeur Application Mobile & UX/UI Designer",
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey.shade800),
              ),
              const SizedBox(height: 20),
              Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      children: [
        const Icon(Icons.person, color: Colors.purple),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            "Développeur mobile & web formé au Canada, en Russie et en Côte d’Ivoire.",
            style: GoogleFonts.poppins(fontSize: 16),
          ),
        ),
      ],
    ),
    const SizedBox(height: 12),
    Row(
      children: [
        const Icon(Icons.code, color: Colors.teal),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            "Compétences : Flutter, JavaScript, Node.js, PHP, Java, C#, C++, SQL.",
            style: GoogleFonts.poppins(fontSize: 16),
          ),
        ),
      ],
    ),
    const SizedBox(height: 12),
    Row(
      children: [
        const Icon(Icons.rocket_launch, color: Colors.orange),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            "Projets : FoodiFly, ChatBot Teams, Korezide.com.",
            style: GoogleFonts.poppins(fontSize: 16),
          ),
        ),
      ],
    ),
    const SizedBox(height: 12),
    Row(
      children: [
        const Icon(Icons.language, color: Colors.blueAccent),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            "Langues : Français (natif), Anglais (courant), Russe (courant).",
            style: GoogleFonts.poppins(fontSize: 16),
          ),
        ),
      ],
    ),
    const SizedBox(height: 12),
    Row(
      children: [
        const Icon(Icons.star, color: Colors.amber),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            "Atouts : Analyse, sécurité, UX/UI design, adaptabilité.",
            style: GoogleFonts.poppins(fontSize: 16),
          ),
        ),
      ],
    ),
  ],
),

              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent.shade400, // Bouton vert clair
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Arrondi du bouton
                  ),
                ),
                onPressed: () {
CVLauncher.openGitHubCV(context);                },
                child: const Text("Télécharger mon CV", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Navbar(currentIndex: 2),
    );
  }
}
