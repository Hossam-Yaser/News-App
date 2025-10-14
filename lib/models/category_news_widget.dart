import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryNewsWidget extends StatelessWidget {
  CategoryNewsWidget({
    required this.imagePath,
    required this.titelText,
    required this.descriptionText,
    super.key,
  });
  String imagePath;
  String titelText;
  String descriptionText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Image.network(
              imagePath,
              height: 180,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Text(
              titelText,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
            Text(
              descriptionText,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
