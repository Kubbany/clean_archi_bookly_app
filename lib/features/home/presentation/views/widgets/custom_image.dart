import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.aspectRatio,
    required this.image,
    required this.borderRadius,
  });
  final double aspectRatio, borderRadius;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              image,
            ),
          ),
        ),
      ),
    );
  }
}
