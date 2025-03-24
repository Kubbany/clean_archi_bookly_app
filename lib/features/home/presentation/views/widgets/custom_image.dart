import 'package:bookly_app/core/utils/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        child: CachedNetworkImage(
          placeholder: (context, url) => Skeletonizer(
            child: Image.asset(AppAssets.testImage),
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey,
            child: const Icon(Icons.error_outline),
          ),
          imageUrl: image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
