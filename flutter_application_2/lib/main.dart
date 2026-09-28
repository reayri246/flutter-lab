import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FlutterImageDemo'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset('lib/images.png'),
              Text(
                'A tablet is a wireless touchscreen computer that is smaller than a notebook but larger than a smartphone.',
                style: TextStyle(fontSize: 20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
