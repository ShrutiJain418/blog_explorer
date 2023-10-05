import 'dart:convert';
import 'dart:io';

import 'package:blog_explorer_app/blogModel.dart';

class BlogService {
  final String apiUrl = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  final String adminSecret =
      '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';
  Future<List<Blog>> fetchBlogs() async {
    // Initialize an HttpClient with SSL certificate validation disabled
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;

    try {
      final request = await httpClient.getUrl(Uri.parse(apiUrl));

      // Use the add method to set headers
      request.headers.add('x-hasura-admin-secret', adminSecret);

      final response = await request.close();

      if (response.statusCode == 200) {
        // Request successful, handle the response data here
        final responseBody = await response.transform(utf8.decoder).join();
        print('Response data: $responseBody');
        // Parse and return data as needed
        // Replace the next line with the actual parsing logic
        return parseResponseData(responseBody);
      } else {
        // Request failed
        print('Request failed with status code: ${response.statusCode}');
        // Handle the error
        // Returning an empty list in case of an error
        return [];
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      print('Error: $e');
      // Handle the error
      // Returning an empty list in case of an error
      return [];
    }
  }
}

List<Blog> parseResponseData(String responseBody) {
  final List<dynamic> data = json.decode(responseBody)['blogs'];
  return data
      .map((item) => Blog(
            id: item['id'],
            imageUrl: item['image_url'],
            title: item['title'],
            content: '',
          ))
      .toList();
}
