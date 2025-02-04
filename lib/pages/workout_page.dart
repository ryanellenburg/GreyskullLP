import 'package:flutter/material.dart';
import 'workout_page_weight.dart';
import 'workout_page_frequency.dart';
import 'workout_page_ladder.dart';
import 'workout_page_totalwork.dart';

class WorkoutPage extends StatefulWidget {
  final ValueNotifier<String> titleNotifier; // Notifier for app bar title

  const WorkoutPage({super.key, required this.titleNotifier});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  Widget? _currentPage; // Holds the current sub-page

  void _openSubPage(Widget page, String title) {
    setState(() {
      _currentPage = page;
    });
    widget.titleNotifier.value = title; // Update title
  }

  @override
  Widget build(BuildContext context) {
    return _currentPage ?? _buildWorkoutMainPage();
  }

  Widget _buildWorkoutMainPage() {
    widget.titleNotifier.value = "Workout"; // Reset title when on main workout page

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildWorkoutButton(IconData(0xf6e6, fontFamily: 'MaterialSymbols'), 'Weight Program', const WorkoutPageWeight()),
              _buildWorkoutButton(Icons.repeat, 'Frequency Method', const WorkoutPageFrequency()),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildWorkoutButton(Icons.trending_up, 'Ladder Method', const WorkoutPageLadder()),
              _buildWorkoutButton(Icons.balance, 'Total Work Method', const WorkoutPageTotalWork()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutButton(IconData icon, String label, Widget page) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 50),
          onPressed: () => _openSubPage(page, label), // Load sub-page and update title
        ),
        Text(label, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}