import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Container Demo',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animated UI Elements'),
        ),
        body: const AnimatedContainerExample(),
      ),
    );
  }
}

// Animated Container Example
class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState
    extends State<AnimatedContainerExample> {

  bool _isExpanded = false;

  void _toggleContainer() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          AnimatedContainer(
            width: _isExpanded ? 200.0 : 100.0,
            height: _isExpanded ? 200.0 : 100.0,

            decoration: BoxDecoration(
              color: _isExpanded
                  ? Colors.blue
                  : Colors.red,

              borderRadius: BorderRadius.circular(
                _isExpanded ? 0 : 50,
              ),
            ),

            duration: const Duration(seconds: 1),

            curve: Curves.easeInOut,

            child: const Center(
              child: Text(
                'Tap Me!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: _toggleContainer,

            child: const Text(
              'Animate Container',
            ),
          ),
        ],
      ),
    );
  }
}