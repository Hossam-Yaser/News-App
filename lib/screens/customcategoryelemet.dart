import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCategoryElement extends StatelessWidget {
  CustomCategoryElement({
    required this.imagePath,
    required this.insideText,
    required this.textColor,
    super.key,
    required titelText,
    required descriptionText,
    this.onTap,
  });
  String imagePath;
  String insideText;
  Color textColor;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        width: MediaQuery.of(context).size.width * 0.45,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            insideText,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
