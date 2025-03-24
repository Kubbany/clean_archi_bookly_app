import 'package:bookly_app/features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({
    super.key,
    required this.image,
    this.isDummy = true,
  });
  final String image;
  final bool isDummy;
  @override
  Widget build(BuildContext context) {
    return CustomImage(
      aspectRatio: 0.65,
      image: image,
      borderRadius: 16,
      isDummy: isDummy,
    );
  }
}
