import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly_app/core/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                spacing: 20,
                children: <Widget>[
                  const BookDetailsAppBar(),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.47,
                    child: const CustomBookItem(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    spacing: 6,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "The Jungle Book",
                        textAlign: TextAlign.center,
                        style: AppStyles.styleSemiBold30,
                      ),
                      Text(
                        "Rudyard Kipling",
                        style: AppStyles.styleSemiBold18.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600],
                        ),
                      ),
                      const Center(
                        child: BookRating(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
