import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class FeaturedBookListViewItem extends StatelessWidget {
  const FeaturedBookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.65,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              AppAssets.testImage,
            ),
          ),
        ),
      ),
    );
  }
}
