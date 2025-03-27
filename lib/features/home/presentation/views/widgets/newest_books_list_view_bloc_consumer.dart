import 'package:bookly_app/core/utils/functions/show_custom_snack_bar.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NewestBooksListViewBlocConsumer extends StatefulWidget {
  const NewestBooksListViewBlocConsumer({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;
  @override
  State<NewestBooksListViewBlocConsumer> createState() => _NewestBooksListViewBlocConsumerState();
}

class _NewestBooksListViewBlocConsumerState extends State<NewestBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        } else if (state is NewestBooksPaginationFailure) {
          showCustomSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksPaginationLoading ||
            state is NewestBooksPaginationFailure) {
          return NewestBooksListView(
            scrollController: widget.scrollController,
            books: books,
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errorMessage),
            ),
          );
        } else {
          return const Skeletonizer.sliver(
            child: DummyNewestBooksListView(),
          );
        }
      },
    );
  }
}
