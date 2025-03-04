import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        SizedBox(
          height: 150,
          child: CustomImage(
            aspectRatio: 0.6,
            image: AppAssets.testImage,
            borderRadius: 8,
          ),
        ),
      ],
    );
  }
}
