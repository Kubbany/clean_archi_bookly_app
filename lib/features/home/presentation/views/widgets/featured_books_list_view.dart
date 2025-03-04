import 'package:bookly_app/features/home/presentation/views/widgets/featured_book_list_view_item.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.25,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
        itemBuilder: (context, index) => const FeaturedBookListViewItem(),
      ),
    );
  }
}
