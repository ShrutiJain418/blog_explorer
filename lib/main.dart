// ignore_for_file: prefer_const_declarations

import 'package:blog_explorer_app/blogProvider.dart';
import 'package:flutter/material.dart';
import 'package:blog_explorer_app/blogListScreen.dart';

import 'package:provider/provider.dart';

// void fetchBlogs() async {
//   HttpClient httpClient = new HttpClient();
//   httpClient.badCertificateCallback =
//       (X509Certificate cert, String host, int port) => true;

//   final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
//   final String adminSecret =
//       '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

//   try {
//     final response = await http.get(Uri.parse(url), headers: {
//       'x-hasura-admin-secret': adminSecret,
//     });

//     if (response.statusCode == 200) {
//       // Request successful, handle the response data here
//       print('Response data: ${response.body}');
//     } else {
//       // Request failed
//       print('Request failed with status code: ${response.statusCode}');
//       print('Response data: ${response.body}');
//     }
//   } catch (e) {
//     // Handle any errors that occurred during the request
//     print('Error: $e');
//   }
// }

// void main() async {
//   final blogProvider = BlogProvider();
//   final blogService = BlogService();

//   try {
//     final blogs = await blogService.fetchBlogs();
//     blogProvider.blogs = blogs;
//   } catch (e) {
//     print('Error: $e');
//   }

//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => blogProvider,
//       child: MaterialApp(
//         title: 'Blog Explorer',
//         home: BlogListScreen(),
//       ),
//     ),
//   );
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BlogProvider>(
          create: (_) => BlogProvider(), // Initialize your provider here
        ),
      ],
      child: MaterialApp(
        title: 'Blog Explorer',
        home: BlogListScreen(),
      ),
    );
  }
}
