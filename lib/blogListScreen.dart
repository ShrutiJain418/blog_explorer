// ignore_for_file: prefer_const_constructors

import 'package:blog_explorer_app/blogModel.dart';
import 'package:blog_explorer_app/blogProvider.dart';
import 'package:blog_explorer_app/detailedBlog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlogListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blogProvider = Provider.of<BlogProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Blogs and Articles',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Blog>>(
        future: blogProvider.fetchBlogs(),
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return Center(child: CircularProgressIndicator());
          // } else if (snapshot.hasError) {
          //   return Center(child: Text('Error: ${snapshot.error}'));
          // } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          //   return Center(child: Text('No blogs available.'));
          // }
          {
            final blogs = snapshot.data;
            return ListView.builder(
              itemCount: blogs?.length,
              itemBuilder: (context, index) {
                final blog = blogs?[index];
                return Container(
                  color: Colors.black,
                  child: Card(
                    borderOnForeground: true,
                    color: Colors.black12,
                    margin: EdgeInsets.only(
                      left: 0.0,
                      right: 8.0,
                      top: 8.0,
                      bottom: 8.0,
                    ),
                    child: ListTile(
                      title: Text(
                        blog!.title,
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: Image.network(
                        blog.imageUrl,
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.favorite_border_outlined),
                        color: Colors.white,
                        onPressed: () {
                          Icon(
                            Icons.favorite,
                            color: Colors.white,
                          );
                        },
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailedBlogPage(blog: blog),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
