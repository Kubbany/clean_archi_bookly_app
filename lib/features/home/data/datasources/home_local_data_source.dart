import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImplementation extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    Box<BookEntity> box = Hive.box<BookEntity>(kFeaturedBooks);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    Box<BookEntity> box = Hive.box<BookEntity>(kNewestBooks);
    return box.values.toList();
  }
}
