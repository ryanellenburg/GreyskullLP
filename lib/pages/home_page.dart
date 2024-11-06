import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Function(int) onItemSelected;
  const HomePage({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16.0),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _buildIcon(context, IconData(0xf6e6, fontFamily: 'MaterialSymbols'), "Workout", 0),
        _buildIcon(context, Icons.forum, "Forum", 1),
        _buildIcon(context, Icons.restaurant, "Diet", 2),
        _buildIcon(context, Icons.stacked_line_chart, "Stats", 3),
        _buildIcon(context, Icons.history, "History", 4),
        _buildIcon(context, Icons.shopping_cart, "Store", 5),
      ],
    );
  }

  Widget _buildIcon(BuildContext context, IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64.0, color: Theme.of(context).primaryColor),
          const SizedBox(height: 8.0),
          Text(label, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
