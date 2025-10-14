import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsServics {
  final Dio dio;

  NewsServics(this.dio);

  Future<List<ArticleModel>> generalNews() async {
    final response = await dio.get(
      'https://newsapi.org/v2/everything?q=bitcoin&apiKey=2ea66131332247839f1bf5198b6b6243',
    );
    Map<String, dynamic> jsonResponse = response.data;
    List<dynamic> rowArticlesFromJson = jsonResponse['articles'];
    List<ArticleModel> news = [];
    for (var article in rowArticlesFromJson) {
      ArticleModel finalArticleData = ArticleModel(
        title: article['title'] ?? "No Title",
        description: article['description'] ?? "No Description",
        urlToImage:
            article['urlToImage'] ??
            "https://gizmodo.com/app/uploads/2025/10/Roger-Ver-1200x675.jpg",
      );
      news.add(finalArticleData);
    }
    return news;
  }
}
