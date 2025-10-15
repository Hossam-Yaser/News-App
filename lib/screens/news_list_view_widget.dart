import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_news_widget.dart';
import 'package:news_app/services/news_categories_serves.dart';
import 'package:news_app/services/news_serves.dart';

import 'news_show_screen.dart';

class NewsListViewWidget extends StatefulWidget {
  const NewsListViewWidget({super.key});

  @override
  State<NewsListViewWidget> createState() => _NewsListViewWidgetState();
}

class _NewsListViewWidgetState extends State<NewsListViewWidget> {
  List<ArticleModel> newsList = [];
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  Future<void> _loadNews() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });

    try {
      newsList = await NewsServics(
        NewsCategoriesServes().topHeadlines,
        Dio(),
      ).generalNews();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Expanded(child: Center(child: CircularProgressIndicator()));
    }

    if (hasError) {
      return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Failed to load news.\nCheck your internet connection.',
              ),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: _loadNews, child: const Text('Retry')),
            ],
          ),
        ),
      );
    }

    return Expanded(
      child: RefreshIndicator(
        onRefresh: _loadNews, // 👈 pull-to-refresh logic
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            final article = newsList[index];
            return CategoryNewsWidget(
              imagePath:
                  article.urlToImage ??
                  "https://gizmodo.com/app/uploads/2025/10/Roger-Ver-1200x675.jpg",
              titelText: article.title ?? "No Title",
              descriptionText: article.description ?? "No Description",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsShowScreen(
                      imageUrl:
                          article.urlToImage ??
                          "https://gizmodo.com/app/uploads/2025/10/Roger-Ver-1200x675.jpg",
                      newsTitle: article.title ?? "No Title",
                      newsDescription: article.description ?? "No Description",
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
