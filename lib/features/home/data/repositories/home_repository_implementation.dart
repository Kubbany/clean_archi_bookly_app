import 'package:bookly_app/core/errors/failure.dart';

import 'package:bookly_app/features/home/data/datasources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImplementation extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepositoryImplementation({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    List<BookEntity> books = homeLocalDataSource.fetchFeaturedBooks();
    if (books.isNotEmpty) {
      return right(books);
    } else {
      try {
        books = await homeRemoteDataSource.fetchFeaturedBooks();
        return right(books);
      } catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioException(e));
        }
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    List<BookEntity> books = homeLocalDataSource.fetchNewestBooks();
    if (books.isNotEmpty) {
      return right(books);
    } else {
      try {
        books = await homeRemoteDataSource.fetchNewestBooks();
        return right(books);
      } catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioException(e));
        }
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({required String category}) async {
    List<BookEntity> books;
    try {
      books = await homeRemoteDataSource.fetchSimilarBooks(category: category);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
