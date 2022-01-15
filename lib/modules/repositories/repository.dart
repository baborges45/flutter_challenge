import 'package:dio/dio.dart';
import 'package:flutter_challenge/model/product_model.dart';

class Repository {
  final Dio _dio;

  Repository(this._dio);

  @override
  Future<List<ProductModel>> getAllProductos() async {
    try {
      final response = await _dio
          .get<List>('https://5f7cba02834b5c0016b058aa.mockapi.io/api/users');
      return response.data!.map((e) => ProductModel.fromMap(e)).toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
