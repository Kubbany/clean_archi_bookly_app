import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/functions/cache_data.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchSimilarBooks({required String category, int pageNumber = 0});
}

class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImplementation(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    Map<String, dynamic> data = await apiService.get(
      endPoint: "volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}",
    );
    List<BookEntity> books = getBooksList(data);
    cacheData<BookEntity>(books, kFeaturedBooks);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    Map<String, dynamic> data = await apiService.get(
      endPoint: "volumes?Filtering=free-ebooks&q=programming&Sorting=newest&startIndex=${pageNumber * 10}",
    );

    List<BookEntity> books = getBooksList(data);

    cacheData<BookEntity>(books, kNewestBooks);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category, int pageNumber = 0}) async {
    Map<String, dynamic> data = await apiService.get(
      endPoint: "volumes?Filtering=free-ebooks&q=subject:$category&Sorting=relevance&startIndex=${pageNumber * 10}",
    );

    List<BookEntity> books = getBooksList(data);

    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data["items"]) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
