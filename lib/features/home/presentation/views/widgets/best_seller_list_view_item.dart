import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 30,
      children: <Widget>[
        const SizedBox(
          height: 150,
          child: CustomImage(
            aspectRatio: 0.6,
            image: AppAssets.testImage,
            borderRadius: 8,
          ),
        ),
        Expanded(
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.5,
                child: Text(
                  "Harry Potter and The Goblet of Fire",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.styleNormal20.copyWith(
                    fontFamily: kGtSectraFine,
                  ),
                ),
              ),
              const Text(
                "J.K Rowling",
                style: AppStyles.styleNormal14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "19.99 €",
                    style: AppStyles.styleNormal20.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const BookRating(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
