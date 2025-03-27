import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/usecases/fetch_newest_books_use_case.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.newestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase newestBooksUseCase;

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }

    Either<Failure, List<BookEntity>> result = await newestBooksUseCase.execute(pageNumber);

    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(NewestBooksFailure(errorMessage: failure.errorMessage));
        } else {
          emit(NewestBooksPaginationFailure(errorMessage: failure.errorMessage));
        }
      },
      (books) {
        emit(NewestBooksSuccess(books: books));
      },
    );
  }
}
