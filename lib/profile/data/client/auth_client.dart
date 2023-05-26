import 'package:dio/dio.dart';

class AuthClient {
  AuthClient(
    this._dio,
  );

  final Dio _dio;

  Future<void> registerUser(String email, String password) => _dio.post('');

  Future<void> loginUser(String email, String password) => _dio.post('');
}
