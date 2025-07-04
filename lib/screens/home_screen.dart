import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/navbar.dart';
import '../screens/contact_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _photoController;
  late AnimationController _textController;

  bool showText = false;
  bool showButtons = false;

  @override
  void initState() {
    super.initState();

    _photoController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _textController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _startAnimation();
  }

  Future<void> _startAnimation() async {
    _photoController.forward();
    await Future.delayed(const Duration(milliseconds: 1000));
    _textController.forward();
    setState(() => showText = true);
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() => showButtons = true);
  }

  @override
  void dispose() {
    _photoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accueil"),
        backgroundColor: Colors.purple.shade700,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple.shade100, Colors.white],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  // Blurred Glow Background
                  AnimatedScale(
                    scale: _photoController.value,
                    duration: const Duration(milliseconds: 1200),
                    child: Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            Colors.purple.withOpacity(0.3),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: const SizedBox(),
                      ),
                    ),
                  ),
                  // Profile Photo with glow
                  ScaleTransition(
                    scale: CurvedAnimation(parent: _photoController, curve: Curves.easeOutBack),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.shade200,
                            blurRadius: 30,
                            spreadRadius: 5,
                          ),
                        ],
                        border: Border.all(color: Colors.purple.shade700, width: 4),
                      ),
                      child: const CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage('../../ios/assets/salif.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              FadeTransition(
                opacity: _textController,
                child: Column(
                  children: [
                    Text(
                      "Salifou Guindo",
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "Développeur Mobile & Web | UX Designer",
                      style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey.shade800),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              AnimatedOpacity(
                opacity: showText ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 800),
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.2),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut)),
                  child: Text(
                    "Bienvenue sur mon portfolio ! Je conçois des applications performantes et modernes en Flutter, JavaScript, Node.js et bien plus. "
                    "Passionné par l’expérience utilisateur, je travaille aussi bien sur le mobile que sur le web.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              if (showButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _SkillIcon(icon: Icons.phone_android, label: 'Flutter'),
                    _SkillIcon(icon: Icons.code, label: 'Node.js'),
                    _SkillIcon(icon: Icons.web, label: 'JavaScript'),
                    _SkillIcon(icon: Icons.coffee, label: 'Java'),
                  ],
                ),
              const SizedBox(height: 30),
              if (showButtons)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent.shade400,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        pageBuilder: (_, __, ___) => const ContactScreen(),
                        transitionsBuilder: (_, animation, __, child) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                      ),
                    );
                  },
                  child: const Text("Me contacter", style: TextStyle(color: Colors.white)),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Navbar(currentIndex: 0),
    );
  }
}

class _SkillIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SkillIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 36, color: Colors.purple.shade700),
        const SizedBox(height: 8),
        Text(label, style: GoogleFonts.poppins(fontSize: 14)),
      ],
    );
  }
}
