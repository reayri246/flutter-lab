import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define global theme properties
        primaryColor: Colors.teal,

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          secondary: Colors.orangeAccent,
        ),

        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Theming Example",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello, Flutter!",
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 20),

            CustomButton(
              text: "Press Me",
              onPressed: () {
                print("Button Pressed");
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Button Widget with Theme Styling
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context)
            .colorScheme
            .primary,

        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      onPressed: onPressed,

      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}