import 'package:flutter/material.dart';
import '../widgets/project_card.dart';
import '../widgets/navbar.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes Projets"),
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
              Colors.red.shade900, // Rouge sombre
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: const [
            ProjectCard(
              title: "Calculatrice Flutter",
              description: "Application mobile moderne avec mode sombre.",
              link: "https://github.com/Guindo97/calculatrice",
              image: "../../ios/assets/calculatrice.png",
            ),
            ProjectCard(
              title: "Application 'Gardien de But'",
              description: "Analyse des performances des gardiens.",
              link: "https://github.com/Guindo97/gardien.git",
              image: "assets/images/gardien.png",
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Navbar(currentIndex: 1),
    );
  }
}
