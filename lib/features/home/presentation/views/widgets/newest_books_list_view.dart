import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView({super.key, required this.books, required this.scrollController});
  final List<BookEntity> books;
  final ScrollController scrollController;
  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {
  bool isLoading = false;
  int nextPage = 1;
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    double currentPosition = widget.scrollController.position.pixels;
    double maxScrollExtent = widget.scrollController.position.maxScrollExtent;
    if (currentPosition >= maxScrollExtent * 0.7) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(
          pageNumber: nextPage++,
        );
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: widget.books.length,
      itemBuilder: (context, index) => NewestListViewItem(
        bookItem: widget.books[index],
        isDummy: false,
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
    );
  }
}

class DummyNewestBooksListView extends StatelessWidget {
  const DummyNewestBooksListView({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 15,
      itemBuilder: (context, index) => const NewestListViewItem(),
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
    );
  }
}
