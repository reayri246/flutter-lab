import 'package:flutter/material.dart';

// Custom Button Widget
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  // Constructor to receive text and onPressed function
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}

// Main App
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Widget Example'),
        ),
        body: Center(
          child: CustomButton(
            text: "Click Me",
            onPressed: () {
              // Action when button is pressed
              print("Button Pressed!");
            },
          ),
        ),
      ),
    );
  }
}