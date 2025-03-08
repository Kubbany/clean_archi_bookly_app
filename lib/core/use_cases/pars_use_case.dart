import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ParsUseCase<T, P> {
  Future<Either<Failure, T>> execute([P pars]);
}
