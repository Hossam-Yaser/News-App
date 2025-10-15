import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_news_widget.dart';
import 'package:news_app/services/news_categories_serves.dart';

import 'package:news_app/services/news_serves.dart';

class NewsListViewWidget extends StatelessWidget {
  const NewsListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: NewsServics(
        NewsCategoriesServes().topHeadlines,
        Dio(),
      ).generalNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final newsList = snapshot.data!;
          return Expanded(
            child: ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (BuildContext context, int index) {
                final article = newsList[index];
                return CategoryNewsWidget(
                  imagePath:
                      article.urlToImage ??
                      "https://gizmodo.com/app/uploads/2025/10/Roger-Ver-1200x675.jpg",
                  titelText: article.title ?? "No Title",
                  descriptionText: article.description ?? "No Description",
                );
              },
            ),
          );
        }
      },
    );
  }
}
