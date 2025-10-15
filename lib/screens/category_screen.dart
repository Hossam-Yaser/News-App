import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_news_widget.dart';
import 'package:news_app/services/news_serves.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatelessWidget {
  String routeCategory;

  CategoryScreen({required this.routeCategory, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: ,

      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Text(
      //       'News',
      //       style: TextStyle(
      //         color: Colors.black,
      //         fontWeight: FontWeight.bold,
      //         fontSize: 26,
      //       ),
      //     ),
      //     Text(
      //       'Cloud',
      //       style: TextStyle(
      //         color: Colors.yellowAccent[700],
      //         fontWeight: FontWeight.bold,
      //         fontSize: 26,
      //       ),
      //     ),
      //   ],
      // ),
      // ),
      body: CustomScrollView(
        slivers: [
          //  The app bar
          SliverAppBar(
            snap: true,
            floating: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'News',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                Text(
                  'Cloud',
                  style: TextStyle(
                    color: Colors.yellowAccent[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ],
            ),
          ),

          //  The body (use SliverToBoxAdapter)
          SliverToBoxAdapter(
            child: SafeArea(
              child: FutureBuilder<List<ArticleModel>>(
                future: NewsServics(routeCategory, Dio()).generalNews(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No news found'));
                  } else {
                    final newsList = snapshot.data!;
                    //  Use ListView.builder INSIDE the SliverToBoxAdapter
                    return ListView.builder(
                      itemCount: newsList.length,
                      shrinkWrap: true, // important when nested
                      physics:
                          const NeverScrollableScrollPhysics(), // disable inner scroll
                      itemBuilder: (BuildContext context, int index) {
                        final article = newsList[index];
                        return CategoryNewsWidget(
                          imagePath:
                              article.urlToImage ??
                              "https://gizmodo.com/app/uploads/2025/10/Roger-Ver-1200x675.jpg",
                          titelText: article.title ?? "No Title",
                          descriptionText:
                              article.description ?? "No Description",
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
