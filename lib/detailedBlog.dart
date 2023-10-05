import 'package:blog_explorer_app/blogModel.dart';
import 'package:flutter/material.dart';

class DetailedBlogPage extends StatelessWidget {
  final Blog blog;

  DetailedBlogPage({required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blog.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(blog.imageUrl),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                blog.content, // Display detailed content here
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
