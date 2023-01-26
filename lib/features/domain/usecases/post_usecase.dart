import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_project_intership/features/data/model/post_model.dart';
import 'package:test_project_intership/features/domain/repositories/post_repositories.dart';

class Post {
  Post(this.postRepositories);

  final PostRepositories postRepositories;

  Future<Either<DioError, List<ProductModel>>> getPost() async {
    return await postRepositories.getPost();
  }

  Future<Either<DioError, void>> deletePost(int id) async {
    return await postRepositories.deletePost(id);
  }

  Future<Either<DioError, void>> addPost(String title, String subtitle) async {
    return await postRepositories.addPost(title, subtitle);
  }
}
