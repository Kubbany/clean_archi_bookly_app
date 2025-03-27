import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SimilarBooksListViewBlocBuilder extends StatefulWidget {
  const SimilarBooksListViewBlocBuilder({
    super.key,
    required this.category,
  });
  final String category;
  @override
  State<SimilarBooksListViewBlocBuilder> createState() => _SimilarBooksListViewBlocBuilderState();
}

class _SimilarBooksListViewBlocBuilderState extends State<SimilarBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
      listener: (context, state) {
        if (state is SimilarBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is SimilarBooksSuccess || state is SimilarBooksPaginationLoading) {
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
