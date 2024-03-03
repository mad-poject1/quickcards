import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
// import './screens/topic_viewer.dart';
// import './screens/flashcard_creator.dart';
// import './widgets/quiz_game.dart';

void main() {
  runApp(const QuickCards());
}

class QuickCards extends StatelessWidget {
  const QuickCards({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
