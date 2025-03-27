import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ParsUseCase<T, P1, P2> {
  Future<Either<Failure, T>> execute([P1 pars1, P2 pars2]);
}
