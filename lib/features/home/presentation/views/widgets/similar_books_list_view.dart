import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.15,
      child: ListView.separated(
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemBuilder: (context, index) => CustomBookItem(
          isDummy: false,
          image: books[index].image ?? "",
        ),
      ),
    );
  }
}

class DummySimilarBooksListView extends StatelessWidget {
  const DummySimilarBooksListView({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.15,
      child: ListView.separated(
        itemCount: 15,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemBuilder: (context, index) => const CustomBookItem(
          image: AppAssets.testImage,
        ),
      ),
    );
  }
}
