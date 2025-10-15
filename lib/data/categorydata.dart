import 'package:flutter/material.dart';
import 'package:news_app/services/news_categories_serves.dart';

class CategoryData {
  final String imagePath;
  final String insideText;
  Color? textColor;
  late String routeCategory;

  static var categories;

  CategoryData({
    required this.imagePath,
    required this.insideText,
    required this.routeCategory,
    this.textColor,
  });
}

class CategoryList {
  static List<CategoryData> categories = [
    CategoryData(
      imagePath: "assets/business.avif",
      insideText: "Business",
      routeCategory: NewsCategoriesServes().business,
    ),
    CategoryData(
      imagePath: "assets/entertaiment.avif",
      insideText: "Entertainment",
      routeCategory: NewsCategoriesServes().entertainment,
    ),
    CategoryData(
      imagePath: "assets/general.avif",
      insideText: "General",
      textColor: Colors.black,
      routeCategory: NewsCategoriesServes().general,
    ),
    CategoryData(
      imagePath: "assets/health.avif",
      insideText: "Health",
      routeCategory: NewsCategoriesServes().health,
    ),
    CategoryData(
      imagePath: "assets/science.avif",
      insideText: "Science",
      routeCategory: NewsCategoriesServes().science,
    ),
    CategoryData(
      imagePath: "assets/sports.avif",
      insideText: "Sports",
      routeCategory: NewsCategoriesServes().sports,
    ),
    CategoryData(
      imagePath: "assets/technology.jpeg",
      insideText: "Technology",
      routeCategory: NewsCategoriesServes().technology,
    ),
  ];
}
