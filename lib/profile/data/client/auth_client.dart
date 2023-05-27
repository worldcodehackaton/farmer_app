import 'package:dio/dio.dart';
import 'package:flutter_farmer_app/profile/domain/models/register_result.dart';

class AuthClient {
  AuthClient(
    this._dio,
  );

  final Dio _dio;

  Future<RegisterResult> registerUser(
    String name,
    String email,
    String password,
  ) async {
    final response = await _dio.post(
      '/api/register',
      data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password,
      },
    );

    return RegisterResult.fromJson(response.data);
  }

  Future<RegisterResult> loginUser(String email, String password) async {
    final response = await _dio.post(
      '/api/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    return RegisterResult.fromJson(response.data);
  }
}
