import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_project_intership/features/data/datasource/post_data_source.dart';
import 'package:test_project_intership/features/data/model/post_model.dart';
import 'package:test_project_intership/features/domain/repositories/post_repositories.dart';

class PostRepositoriesImpl extends PostRepositories {
  PostRepositoriesImpl({required this.postDataSourceImpl});

  final PostDataSource postDataSourceImpl;
  @override
  Future<Either<DioError, List<ProductModel>>> getPost() async {
    try {
      final getPostR = await postDataSourceImpl.getPost();
      return Right(getPostR);
    } on DioError catch (e) {
      return Left(e);
    }
  }
}
