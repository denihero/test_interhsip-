import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_project_intership/features/data/model/post_model.dart';

abstract class PostRepositories {
  Future<Either<DioError, List<ProductModel>>> getPost();
  Future<Either<DioError, void>> deletePost(int id);
  Future<Either<DioError, void>> addPost(String title,String subtitle);
}