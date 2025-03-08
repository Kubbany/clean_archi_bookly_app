import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/use_cases/no_pars_use_case.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>> {
  final HomeRepository homeRepository;

  FetchFeaturedBooksUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<BookEntity>>> execute() async {
    return await homeRepository.fetchFeaturedBooks();
  }
}
