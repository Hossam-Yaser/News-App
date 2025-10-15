import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsServics {
  final Dio dio;
  String category;

  NewsServics(this.category, this.dio);

  Future<List<ArticleModel>> generalNews() async {
    final response = await dio.get(category);
    Map<String, dynamic> jsonResponse = response.data;
    List<dynamic> rowArticlesFromJson = jsonResponse['articles'];
    List<ArticleModel> news = [];
    for (var article in rowArticlesFromJson) {
      ArticleModel finalArticleData = ArticleModel(
        title: article['title'],
        description: article['description'],
        urlToImage: article['urlToImage'],
      );
      news.add(finalArticleData);
    }
    return news;
  }
}
