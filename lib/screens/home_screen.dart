import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Quick',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 113, 103),
                ),
              ),
              Text(
                'Cards',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 90, 181, 255),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: Image.asset(
              'lib/images/logo.png',
              width: 250,
              height: 250,
            ),
          ),
          const SizedBox(height: 30),
          MenuButton(
            title: 'Topic Viewer',
            color: const Color.fromARGB(255, 255, 232,
                194)!, // Use the '!' to assert that the color is not null
            onPressed: () {
              // TODO: Implement Topic Viewer Navigation
            },
          ),
          MenuButton(
            title: 'Flashcard Creator',
            color: Colors
                .red[100]!, // Use the '!' to assert that the color is not null
            onPressed: () {
              // TODO: Implement Flashcard Creator Navigation
            },
          ),
          MenuButton(
            title: 'Quiz Game',
            color: Colors
                .blue[100]!, // Use the '!' to assert that the color is not null
            onPressed: () {
              // TODO: Implement Quiz Game Navigation
            },
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;

  const MenuButton({
    Key? key,
    required this.title,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0), // Spacing around the button
      width: double.infinity, // Makes the button expand to fit the width
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Set the background color
          padding: const EdgeInsets.symmetric(vertical: 20), // Button size
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded edges
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
        ),
      ),
    );
  }
}
