// ignore_for_file: file_names

import 'package:blog_explorer_app/blogModel.dart';
import 'package:blog_explorer_app/blogService.dart';
import 'package:flutter/material.dart';

class BlogProvider with ChangeNotifier {
  List<Blog> _blogs = [];

  List<Blog> get blogs => _blogs;

  set blogs(List<Blog> value) {
    _blogs = value;
    // notifyListeners();
  }

  Future<List<Blog>> fetchBlogs() async {
    try {
      final blogService = BlogService();
      final blogs = await blogService.fetchBlogs();
      // Update the blogs using the setter
      this.blogs = blogs;
      print('Fetched ${blogs.length} blogs');
      return blogs;
    } catch (e) {
      // Handle errors as needed
      print('Error fetching blogs: $e');
      throw e;
    }
  }
}
