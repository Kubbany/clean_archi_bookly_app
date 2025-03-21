import 'package:cached_network_image/cached_network_image.dart';
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
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        child: CachedNetworkImage(
          errorWidget: (context, url, error) => Container(
            color: Colors.grey,
          ),
          imageUrl: image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
