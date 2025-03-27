import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NewestBooksListViewBlocBuilder extends StatefulWidget {
  const NewestBooksListViewBlocBuilder({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;
  @override
  State<NewestBooksListViewBlocBuilder> createState() => _NewestBooksListViewBlocBuilderState();
}

class _NewestBooksListViewBlocBuilderState extends State<NewestBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess || state is NewestBooksPaginationLoading) {
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
