import 'package:bookly_app/core/utils/functions/show_custom_snack_bar.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SimilarBooksListViewBlocConsumer extends StatefulWidget {
  const SimilarBooksListViewBlocConsumer({
    super.key,
    required this.category,
  });
  final String category;
  @override
  State<SimilarBooksListViewBlocConsumer> createState() => _SimilarBooksListViewBlocConsumerState();
}

class _SimilarBooksListViewBlocConsumerState extends State<SimilarBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
      listener: (context, state) {
        if (state is SimilarBooksSuccess) {
          books.addAll(state.books);
        } else if (state is SimilarBooksPaginationFailure) {
          showCustomSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is SimilarBooksSuccess ||
            state is SimilarBooksPaginationLoading ||
            state is SimilarBooksPaginationFailure) {
          return SimilarBooksListView(
            category: widget.category,
            books: books,
          );
        } else if (state is SimilarBooksFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const Skeletonizer(
            child: DummySimilarBooksListView(),
          );
        }
      },
    );
  }
}
