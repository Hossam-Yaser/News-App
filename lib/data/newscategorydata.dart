class NewsCategory {
  final String imagePath;
  final String titelText;
  final String descriptionText;

  NewsCategory({
    required this.imagePath,
    required this.titelText,
    required this.descriptionText,
  });
}

class NewsDataNewsCategory {
  static List<NewsCategory> categories = [
    NewsCategory(
      imagePath: "assets/business.avif",
      titelText: "Business",
      descriptionText: "Latest business news and updates",
    ),
    NewsCategory(
      imagePath: "assets/entertaiment.avif",
      titelText: "Entertainment",
      descriptionText: "Celebrity news and entertainment updates",
    ),
    NewsCategory(
      imagePath: "assets/general.avif",
      titelText: "General",
      descriptionText: "General news from around the world",
    ),
    NewsCategory(
      imagePath: "assets/health.avif",
      titelText: "Health",
      descriptionText: "Health tips and medical news",
    ),
    NewsCategory(
      imagePath: "assets/science.avif",
      titelText: "Science",
      descriptionText: "Discoveries and advancements in science",
    ),
    NewsCategory(
      imagePath: "assets/sports.avif",
      titelText: "Sports",
      descriptionText: "Latest sports news and scores",
    ),
    NewsCategory(
      imagePath: "assets/technology.jpeg",
      titelText: "Technology",
      descriptionText: "Tech news and gadget reviews",
    ),
  ];
}
