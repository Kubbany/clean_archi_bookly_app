import 'package:bookly_app/features/home/presentation/views/widgets/book_details_.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly_app/core/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_actions.dart';
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
                    width: MediaQuery.sizeOf(context).width * 0.47,
                    child: const CustomBookItem(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
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
          ],
        ),
      ),
    );
  }
}
