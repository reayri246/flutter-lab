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
      title: 'Fade Animation Example',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),

      home: const FadeAnimationWidget(),
    );
  }
}

// Fade Animation Widget
class FadeAnimationWidget extends StatefulWidget {
  const FadeAnimationWidget({super.key});

  @override
  State<FadeAnimationWidget> createState() =>
      _FadeAnimationWidgetState();
}

class _FadeAnimationWidgetState
    extends State<FadeAnimationWidget>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Create AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    // Create opacity animation
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start animation
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fade Animation Example',
        ),
      ),

      body: Center(
        child: FadeTransition(
          opacity: _opacityAnimation,

          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,

            child: const Center(
              child: Text(
                'Fade Animation',
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