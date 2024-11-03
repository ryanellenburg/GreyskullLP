import 'package:flutter/material.dart';
import 'themes/theme.dart'; // Import the theme file
import 'dart:async';

void main() {
  runApp(const GreyskullApp());
}

class GreyskullApp extends StatelessWidget {
  const GreyskullApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greyskull LP',
      theme: AppTheme.lightTheme, // Use light theme
      darkTheme: AppTheme.darkTheme, // Use dark theme
      themeMode: ThemeMode.system, // Automatically switches based on system theme
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState(); // Make this public
}

class SplashScreenState extends State<SplashScreen> { // Remove the underscore
  @override
  void initState() {
    super.initState();
    // Start the timer when the widget is first built
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020202), // Match the native splash color
      body: Center(
        child: Image.asset('assets/icon/app_splash_icon.png'),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Greyskull LP Workout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Greyskull LP App!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add navigation to other parts of your app here
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
