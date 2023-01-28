import 'package:dio/dio.dart';
import 'package:test_project_intership/features/data/model/post_model.dart';

abstract class PostDataSource {
  Future<List<ProductModel>> getPost();
}

class PostDataSourceImpl extends PostDataSource {
  PostDataSourceImpl({required this.client});

  final Dio client;

  @override
  Future<List<ProductModel>> getPost() async {
    final List<ProductModel> ls = [];
    final response = await client.get('/products/');

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
