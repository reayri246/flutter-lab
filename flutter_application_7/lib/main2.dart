import 'package:flutter/material.dart';

// Main application
void main() {
  runApp(const MyApp());
}

// A simple application with a counter
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Debugging Example',
      home: const CounterPage(),
    );
  }
}

// Stateful widget for counter functionality
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  // Increment counter
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Decrement counter
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  // Cause an error
  void _causeError() {
    try {
      // Intentional division-by-zero error
      int result = _counter ~/ 0;

      print('Result: $result');
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Debugging Example',
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            const Text(
              'Button pressed this many times:',
            ),

            Text(
              '$_counter',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Increment'),
            ),

            ElevatedButton(
              onPressed: _decrementCounter,
              child: const Text('Decrement'),
            ),

            ElevatedButton(
              onPressed: _causeError,
              child: const Text('Cause Error'),
            ),
          ],
        ),
      ),
    );
  }
}