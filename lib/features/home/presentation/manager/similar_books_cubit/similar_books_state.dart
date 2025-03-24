part of 'similar_books_cubit.dart';

@immutable
sealed class SimilarBooksState {}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksFailure extends SimilarBooksState {
  final String errorMessage;

  SimilarBooksFailure({required this.errorMessage});
}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookEntity> books;

  SimilarBooksSuccess({required this.books});
}

final class SimilarBooksLoading extends SimilarBooksState {}
