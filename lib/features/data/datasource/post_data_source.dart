import 'package:dio/dio.dart';
import 'package:test_project_intership/features/data/model/post_model.dart';

abstract class PostDataSource {
  Future<List<ProductModel>> getPost();
  Future<void> deletePost(int id);
  Future<void> addPost(String title, String subtitle);
}

class PostDataSourceImpl extends PostDataSource {
  PostDataSourceImpl({required this.client});

  final Dio client;

  @override
  Future<void> addPost(String title, String subtitle) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<void> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getPost() async {
    final List<ProductModel> ls = [];
    final response =
        await client.get('https://fakestoreapi.com/products/');

    if (response.statusCode! >= 400) {
      throw Exception('Error');
    } else if (response.statusCode! >= 200) {
      for (var item in response.data) {
        ls.add(ProductModel.fromJson(item));
      }
      return ls;
    }

    return ls;
  }
}
