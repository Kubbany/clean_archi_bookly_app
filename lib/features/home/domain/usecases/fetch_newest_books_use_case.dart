import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/use_cases/pars_use_case.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends ParsUseCase<List<BookEntity>, int, void> {
  final HomeRepository homeRepository;

  FetchNewestBooksUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<BookEntity>>> execute([int pageNumber = 0, void param]) async {
    return await homeRepository.fetchNewestBooks(pageNumber: pageNumber);
  }
}
