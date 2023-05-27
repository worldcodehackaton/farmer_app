import 'package:dio/dio.dart';
import 'package:flutter_farmer_app/farmer/domain/models/product.dart';

class FarmerClient {
  FarmerClient(
    this._dio,
  );

  final Dio _dio;

  Future<void> fetchFarmers() async {
    final response = await _dio.get('api/store/');

    return response.data;
  }

  Future<List<Product>> fetchFarmerProducs() async {
    final response = await _dio.get('api/product/');
    final products = Products.fromJson(response.data);
    return products.data;
  }
}
