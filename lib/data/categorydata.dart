import 'package:flutter/material.dart';

class CategoryData {
  final String imagePath;
  final String insideText;
  Color? textColor;

  static var categories;

  CategoryData({
    required this.imagePath,
    required this.insideText,
    this.textColor,
  });
}

class CategoryList {
  static List<CategoryData> categories = [
    CategoryData(imagePath: "assets/business.avif", insideText: "Business"),
    CategoryData(
      imagePath: "assets/entertaiment.avif",
      insideText: "Entertainment",
    ),
    CategoryData(
      imagePath: "assets/general.avif",
      insideText: "General",
      textColor: Colors.black,
    ),
    CategoryData(imagePath: "assets/health.avif", insideText: "Health"),
    CategoryData(imagePath: "assets/science.avif", insideText: "Science"),
    CategoryData(imagePath: "assets/sports.avif", insideText: "Sports"),
    CategoryData(imagePath: "assets/technology.jpeg", insideText: "Technology"),
  ];
}
