import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsShowScreen extends StatelessWidget {
  final String imageUrl;
  final String newsTitle;
  final String newsDescription;

  const NewsShowScreen({
    super.key,
    required this.imageUrl,
    required this.newsTitle,
    required this.newsDescription,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(
              newsTitle,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(newsDescription, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
