import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _textController;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();

    // Text Animation
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _textAnimation = CurvedAnimation(
      parent: _textController,
      curve: Curves.easeIn,
    );
    _textController.forward();

    // Navigate after 3 seconds
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/signIn'); // Replace with your home route
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3C8CE7), Color(0xFF00F0FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo/Image
              Image.asset(
                'assets/logo.png', // ganti dengan path logo kamu
                height: 120,
              ),
              const SizedBox(height: 20),
              // Animated Text
              FadeTransition(
                opacity: _textAnimation,
                child: const Text(
                  "Desain Cepat & Profesional",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
