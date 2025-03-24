import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewestListViewItem extends StatelessWidget {
  const NewestListViewItem({super.key, this.bookItem, this.isDummy = true});
  final BookEntity? bookItem;
  final bool isDummy;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isDummy) {
          GoRouter.of(context).push(
            AppRouter.kBookDetailsView,
            extra: bookItem,
          );
        }
      },
      child: Row(
        spacing: 30,
        children: <Widget>[
          SizedBox(
            height: 150,
            child: CustomImage(
              isDummy: isDummy,
              aspectRatio: 0.6,
              image: isDummy ? AppAssets.testImage : bookItem!.image ?? "",
              borderRadius: 8,
            ),
          ),
          Expanded(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  child: Text(
                    !isDummy ? bookItem!.title : "Dummy Book Title",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.styleNormal20.copyWith(
                      fontFamily: kGtSectraFine,
                    ),
                  ),
                ),
                Text(
                  !isDummy ? bookItem!.authorName! : "Dummy Book Author",
                  style: AppStyles.styleNormal14.copyWith(
                    color: Colors.grey[500],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Free",
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
      ),
    );
  }
}
