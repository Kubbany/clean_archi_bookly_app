import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_list_view_bloc_consumer.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/home_view_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            const SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  HomeViewAppBar(),
                  FeaturedBooksListViewBlocConsumer(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Newest Books",
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
            NewestBooksListViewBlocConsumer(
              scrollController: scrollController,
            ),
          ],
        ),
      ),
    );
  }
}
