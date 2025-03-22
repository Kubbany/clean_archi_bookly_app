import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_list_view_item.dart';
import 'package:flutter/material.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: books.length,
      itemBuilder: (context, index) => NewestListViewItem(
        bookItem: books[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
    );
  }
}
