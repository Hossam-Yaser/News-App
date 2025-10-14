import 'package:flutter/material.dart';
import 'package:news_app/screens/main_categories_widget.dart';
import 'package:news_app/screens/news_list_view_widget.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
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
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            children: [MainCategoriesWidget(), NewsListViewWidget()],
          ),
        ),
      ),
    );
  }
}
