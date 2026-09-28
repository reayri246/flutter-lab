import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Main application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter UI Test Example'),
        ),
        body: const Center(
          child: MyButton(),
        ),
      ),
    );
  }
}

// Stateful button widget
class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  String buttonText = 'Press Me';

  void _changeText() {
    setState(() {
      buttonText = 'Pressed!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _changeText,
      child: Text(buttonText),
    );
  }
}