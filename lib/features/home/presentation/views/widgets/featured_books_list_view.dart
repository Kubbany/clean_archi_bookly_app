import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late final ScrollController _scrollController;
  bool isLoading = false;
  int nextPage = 1;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    double currentPosition = _scrollController.position.pixels;
    double maxScrollExtent = _scrollController.position.maxScrollExtent;
    if (currentPosition >= maxScrollExtent * 0.7) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks(
          pageNumber: nextPage++,
        );
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.25,
      child: ListView.separated(
        controller: _scrollController,
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            GoRouter.of(context).push(
              AppRouter.kBookDetailsView,
              extra: widget.books[index],
            );
          },
          child: CustomBookItem(
            isDummy: false,
            image: widget.books[index].image ?? "",
          ),
        ),
      ),
    );
  }
}

class DummyFeaturedBooksListView extends StatelessWidget {
  const DummyFeaturedBooksListView({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.25,
      child: ListView.separated(
        itemCount: 15,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
        itemBuilder: (context, index) => const CustomBookItem(
          image: AppAssets.testImage,
        ),
      ),
    );
  }
}
