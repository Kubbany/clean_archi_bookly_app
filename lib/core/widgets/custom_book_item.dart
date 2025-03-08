import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomImage(
      aspectRatio: 0.65,
      image: AppAssets.testImage,
      borderRadius: 16,
    );
  }
}
