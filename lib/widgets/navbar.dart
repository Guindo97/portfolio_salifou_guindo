import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/projects_screen.dart';
import '../screens/about_screen.dart';
import '../screens/contact_screen.dart';

class Navbar extends StatelessWidget {
  final int currentIndex;

  const Navbar({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return; // Évite de recharger la même page

    Widget nextScreen;
    switch (index) {
      case 0:
        nextScreen = const HomeScreen();
        break;
      case 1:
        nextScreen = const ProjectsScreen();
        break;
      case 2:
        nextScreen = const AboutScreen();
        break;
      case 3:
        nextScreen = const ContactScreen();
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) => nextScreen,
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue.shade900,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: (index) => _onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
        BottomNavigationBarItem(icon: Icon(Icons.work), label: "Projets"),
        BottomNavigationBarItem(icon: Icon(Icons.info), label: "À propos"),
        BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: "Contact"),
      ],
    );
  }
}
