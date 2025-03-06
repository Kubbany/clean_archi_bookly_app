import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly_app/core/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_actions.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
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
                spacing: 15,
                children: <Widget>[
                  const BookDetailsAppBar(),
                  const SizedBox(),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.44,
                    child: const CustomBookItem(),
                  ),
                  const SizedBox(),
                  const BookDetails(),
                  const SizedBox(),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: BooksActions(),
                  )
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Expanded(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  Text(
                    "You Can Also Like",
                    style: AppStyles.styleNormal14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SimilarBooksListView(),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
