import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly_app/core/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_actions.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                spacing: 30,
                children: <Widget>[
                  const BookDetailsAppBar(),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.44,
                    child: CustomBookItem(
                      isDummy: false,
                      image: book.image ?? "",
                    ),
                  ),
                  BookDetails(
                    title: book.title,
                    author: book.authorName ?? "Unknown Author",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: BooksActions(
                      url: book.url,
                      pdf: book.pdf,
                    ),
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
                      height: 30,
                    ),
                  ),
                  Text(
                    "You Can Also Like",
                    style: AppStyles.styleNormal14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SimilarBooksListViewBlocBuilder(category: book.category),
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
