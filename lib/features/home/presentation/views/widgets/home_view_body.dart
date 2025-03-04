import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/home_view_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(
          16,
        ),
        child: Column(
          spacing: 20,
          children: [
            HomeViewAppBar(),
            FeaturedBooksListView(),
          ],
        ),
      ),
    );
  }
}
