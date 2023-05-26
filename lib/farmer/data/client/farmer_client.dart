import 'package:dio/dio.dart';

class FarmerClient {
  FarmerClient(
    this.dio,
  );

  Dio dio;

  Future<void> fetchAllFarmers() async {
    final result = await dio.get('');

    return result.data;
  }
}
