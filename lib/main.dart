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
  int _selectedIndex = -1; // Start with -1 to show HomePage initially
  final ValueNotifier<String> _appBarTitle = ValueNotifier("Official Greyskull LP App");

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.add(WorkoutPage(titleNotifier: _appBarTitle)); // Pass notifier to WorkoutPage
    _pages.addAll([
      const ForumPage(),
      const DietPage(),
      const StatsPage(),
      const HistoryPage(),
      const StorePage(),
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      _appBarTitle.value = "Workout"; // Reset title when switching back
    } else {
      _appBarTitle.value = _getPageTitle(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final exerciseIcon = Icon(IconData(0xf6e6, fontFamily: 'MaterialSymbols'));

    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder<String>(
          valueListenable: _appBarTitle,
          builder: (context, title, _) => Text(title),
        ),
        leading: _selectedIndex == -1
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _selectedIndex = -1;
                    _appBarTitle.value = "Official Greyskull LP App"; // Reset title
                  });
                },
              ),
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
      body: _selectedIndex == -1 ? HomePage(onItemSelected: _onItemTapped) : _pages[_selectedIndex],
      bottomNavigationBar: _selectedIndex == -1
          ? null
          : BottomNavigationBar(
              backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
              selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
              unselectedItemColor: theme.bottomNavigationBarTheme.unselectedItemColor,
              items: [
                BottomNavigationBarItem(icon: exerciseIcon, label: 'Workout'),
                BottomNavigationBarItem(icon: Icon(Icons.forum), label: 'Forum'),
                BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Diet'),
                BottomNavigationBarItem(icon: Icon(Icons.stacked_line_chart), label: 'Stats'),
                BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Store'),
              ],
              currentIndex: _selectedIndex >= 0 ? _selectedIndex : 0,
              onTap: _onItemTapped,
            ),
    );
  }

  String _getPageTitle(int index) {
    switch (index) {
      case 0: return 'Workout';
      case 1: return 'Forum';
      case 2: return 'Diet';
      case 3: return 'Stats';
      case 4: return 'History';
      case 5: return 'Store';
      default: return 'Greyskull LP Workout';
    }
  }
}
