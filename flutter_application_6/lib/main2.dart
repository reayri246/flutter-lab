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
          title: const Text('Fetched Data Display'),
        ),

        body: const PostDataDisplay(),
      ),
    );
  }
}

// Post Data Display
class PostDataDisplay extends StatefulWidget {
  const PostDataDisplay({super.key});

  @override
  State<PostDataDisplay> createState() =>
      _PostDataDisplayState();
}

class _PostDataDisplayState extends State<PostDataDisplay> {
  Map<String, dynamic>? post;

  // Fetch post from API
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

    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: post == null
          ? const CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.all(16.0),

              child: Card(
                elevation: 4,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(16.0),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,

                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      // Author ID
                      Text(
                        'Author ID: ${post!['userId']}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Title
                      Text(
                        'Title: ${post!['title']}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Body heading
                      const Text(
                        'Body:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 5),

                      // Body
                      Text(
                        post!['body'],
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}