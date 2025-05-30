import 'package:bookly_app/features/home/domain/usecases/fetch_similar_books_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.similarBooksUseCase) : super(SimilarBooksInitial());
  final FetchSimilarBooksUseCase similarBooksUseCase;

  Future<void> fetchSimilarBooks({required String cateogry, int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(SimilarBooksLoading());
    } else {
      emit(SimilarBooksPaginationLoading());
    }
    Either<Failure, List<BookEntity>> result = await similarBooksUseCase.execute(cateogry, pageNumber);

    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(SimilarBooksFailure(errorMessage: failure.errorMessage));
        } else {
          emit(SimilarBooksPaginationFailure(errorMessage: failure.errorMessage));
        }
      },
      (books) {
        emit(SimilarBooksSuccess(books: books));
      },
    );
  }
}
