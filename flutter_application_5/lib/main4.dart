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
      title: 'Scale Animation Example',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),

      home: const ScaleAnimationWidget(),
    );
  }
}

// Scale Animation Widget
class ScaleAnimationWidget extends StatefulWidget {
  const ScaleAnimationWidget({super.key});

  @override
  State<ScaleAnimationWidget> createState() =>
      _ScaleAnimationWidgetState();
}

class _ScaleAnimationWidgetState
    extends State<ScaleAnimationWidget>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Animation Controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Scale Animation
    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start Animation
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scale Animation Example'),
      ),

      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,

          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,

            child: const Center(
              child: Text(
                'Scale Animation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}