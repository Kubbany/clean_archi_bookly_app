import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_books_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_list_view_bloc_builder.dart';
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
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  HomeViewAppBar(),
                  FeaturedBooksListViewBlocBuilder(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Best Seller",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(),
                ],
              ),
            ),
            BestSellerBooksListView(),
          ],
        ),
      ),
    );
  }
}
