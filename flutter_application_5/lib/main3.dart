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
      title: 'Slide Animation Example',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),

      home: const SlideAnimationWidget(),
    );
  }
}

// Slide Animation Widget
class SlideAnimationWidget extends StatefulWidget {
  const SlideAnimationWidget({super.key});

  @override
  State<SlideAnimationWidget> createState() =>
      _SlideAnimationWidgetState();
}

class _SlideAnimationWidgetState
    extends State<SlideAnimationWidget>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Animation Controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Slide Animation
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(0.0, 0.0),
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
        title: const Text('Slide Animation Example'),
      ),

      body: Center(
        child: SlideTransition(
          position: _slideAnimation,

          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,

            child: const Center(
              child: Text(
                'Slide Animation',
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