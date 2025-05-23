import 'package:flutter/material.dart';
import 'package:mobprog_3/pages/splash_screen.dart';
import 'package:mobprog_3/pages/signIn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/signIn': (context) => const SignIn(),
      },
    );
  }
}
