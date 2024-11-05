import 'package:flutter/material.dart';

class DietPage extends StatelessWidget {
  const DietPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Diet')),
      body: const Center(child: Text('Diet Page')),
    );
  }
}
