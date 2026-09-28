import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Data Example',

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data from API'),
        ),

        body: const PostData(),
      ),
    );
  }
}

// Post Data Widget
class PostData extends StatefulWidget {
  const PostData({super.key});

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  Map<String, dynamic>? post;

  // Fetch data from API
  Future<void> fetchPost() async {
    final response = await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/posts/1',
      ),
    );

    if (response.statusCode == 200) {
      setState(() {
        post = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    super.initState();

    // Call API when page starts
    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: post == null
          ? const CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.all(16.0),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    'Title: ${post!['title']}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Body: ${post!['body']}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}