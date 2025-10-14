import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_news_widget.dart';
import 'package:news_app/services/news_serves.dart';

class NewsListViewWidget extends StatefulWidget {
  const NewsListViewWidget({super.key});

  @override
  State<NewsListViewWidget> createState() => _NewsListViewWidgetState();
}

class _NewsListViewWidgetState extends State<NewsListViewWidget> {
  List<ArticleModel> newsList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    try {
      final news = await NewsServics(Dio()).generalNews();
      setState(() {
        newsList = news;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching news: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Expanded(
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final article = newsList[index];
              return CategoryNewsWidget(
                imagePath:
                    article.urlToImage ??
                    "https://gizmodo.com/app/uploads/2025/10/Roger-Ver-1200x675.jpg",
                titelText: article.title ?? "No Title",
                descriptionText: article.description ?? "No Description",
              );
            }, childCount: newsList.length),
          ),
        ],
      ),
    );
  }
}
