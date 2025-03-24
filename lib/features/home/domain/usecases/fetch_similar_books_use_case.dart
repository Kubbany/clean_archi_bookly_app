import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/use_cases/pars_use_case.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase extends ParsUseCase<List<BookEntity>, String> {
  final HomeRepository homeRepository;

  FetchSimilarBooksUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<BookEntity>>> execute([String? category]) {
    return homeRepository.fetchSimilarBooks(category: category!);
  }
}
