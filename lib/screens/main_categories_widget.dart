import 'package:flutter/material.dart';
import 'package:news_app/data/categorydata.dart';
import 'package:news_app/screens/category_screen.dart';
import 'package:news_app/screens/customcategoryelemet.dart';

class MainCategoriesWidget extends StatelessWidget {
  const MainCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      height: 100,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return CustomCategoryElement(
                imagePath: CategoryList.categories[index].imagePath,
                insideText: CategoryList.categories[index].insideText,
                textColor:
                    CategoryList.categories[index].textColor ?? Colors.white,
                titelText: null,
                descriptionText: null,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryScreen(
                        routeCategory:
                            CategoryList.categories[index].routeCategory,
                      ),
                    ),
                  );
                },
              );
            }, childCount: CategoryList.categories.length),
          ),
        ],
      ),
    );
  }
}
