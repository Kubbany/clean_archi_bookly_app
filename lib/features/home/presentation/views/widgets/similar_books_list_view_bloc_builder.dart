import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SimilarBooksListViewBlocBuilder extends StatelessWidget {
  const SimilarBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SimilarBooksListView(
            books: state.books,
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
