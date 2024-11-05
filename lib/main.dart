import 'package:flutter/material.dart';
import 'package:greyskull_lp/pages/diet_page.dart';
import 'package:greyskull_lp/pages/forum_page.dart';
import 'package:greyskull_lp/pages/history_page.dart';
import 'package:greyskull_lp/pages/home_page.dart';
import 'package:greyskull_lp/pages/settings_page.dart';
import 'package:greyskull_lp/pages/stats_page.dart';
import 'package:greyskull_lp/pages/store_page.dart';
import 'package:greyskull_lp/pages/workout_page.dart';
import 'themes/theme.dart';
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
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/main': (context) => const MainPage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const MainPage(), // Redirect to MainPage
          transitionsBuilder: (_, anim, __, child) {
            return FadeTransition(opacity: anim, child: child);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020202),
      body: Center(
        child: Image.asset('assets/icon/app_splash_icon.png'),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedIndex = -1; // Start with -1 for no selection

  final List<Widget> _pages = const [
    WorkoutPage(),
    ForumPage(),
    DietPage(),
    StatsPage(),
    HistoryPage(),
    StorePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Greyskull LP Workout'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: _selectedIndex == -1 ? const HomePage() : _pages[_selectedIndex], // Load HomePage initially
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
        selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: theme.bottomNavigationBarTheme.unselectedItemColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center), // Workout icon
            label: 'Workout',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum), // Forum icon
            label: 'Forum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant), // Diet icon
            label: 'Diet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_line_chart), // Stats icon
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history), // History icon
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), // Store icon
            label: 'Store',
          ),
        ],
        currentIndex: _selectedIndex >= 0 ? _selectedIndex : 0, // Show the current index, default to 0 when -1
        onTap: (index) {
          // When tapping on the navigation, set _selectedIndex
          if (index != _selectedIndex) {
            _onItemTapped(index);
          }
        },
      ),
    );
  }
}
