import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/datasources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/data/repositories/home_repository_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  BaseOptions options = BaseOptions(
    baseUrl: ApiService.baseURL,
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(minutes: 1), // 60 seconds
    receiveTimeout: const Duration(minutes: 1), // 60 seconds
  );
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(options),
    ),
  );

  getIt.registerSingleton<HomeRemoteDataSourceImplementation>(
    HomeRemoteDataSourceImplementation(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<HomeLocalDataSourceImplementation>(
    HomeLocalDataSourceImplementation(),
  );

  getIt.registerSingleton<HomeRepositoryImplementation>(
    HomeRepositoryImplementation(
      homeRemoteDataSource: getIt.get<HomeRemoteDataSourceImplementation>(),
      homeLocalDataSource: getIt.get<HomeLocalDataSourceImplementation>(),
    ),
  );
}
