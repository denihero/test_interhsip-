import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_project_intership/features/data/datasource/post_data_source.dart';
import 'package:test_project_intership/features/data/repositories/post_repositories_impl.dart';
import 'package:test_project_intership/features/domain/repositories/post_repositories.dart';
import 'package:test_project_intership/features/domain/usecases/post_usecase.dart';
import 'package:test_project_intership/features/presentation/bloc/get_post_cubit/get_post_cubit.dart';

final getIt = GetIt.instance;
setupLocator() {
  //Bloc
  getIt.registerFactory(() => GetPostCubit(getIt()));

  //UseCases
  getIt.registerLazySingleton(() => Post(getIt()));

  //Service
  getIt.registerLazySingleton<PostDataSource>(
      () => PostDataSourceImpl(client: Dio()));
  
  
  //Repositories
  getIt.registerLazySingleton<PostRepositories>(() => PostRepositoriesImpl(postDataSourceImpl: getIt()));
}
