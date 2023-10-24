import 'package:flutter/material.dart';
import 'package:water_consume_tracker/home_screen.dart';

void main() {
  runApp(const waterConsumeTracker());
}

class waterConsumeTracker extends StatelessWidget {
  const waterConsumeTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: const HomeScreen(),
    );
  }
}
