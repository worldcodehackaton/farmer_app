import 'package:flutter/material.dart';
import 'package:flutter_farmer_app/common/result.dart';
import 'package:flutter_farmer_app/profile/data/client/auth_client.dart';
import 'package:flutter_farmer_app/profile/data/repositories/auth_repository.dart';
import 'package:flutter_farmer_app/profile/domain/models/register_result.dart';

// const _tokenKey = 'Token';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._authClient,
    // this._preferences,
  );

  final AuthClient _authClient;

  // final SharedPreferences _preferences;

  @override
  Future<Result<RegisterResult?>> registerUser(
    String name,
    String email,
    String password,
  ) async {
    try {
      final result = Result<RegisterResult>.succeed(
        await _authClient.registerUser(
          name,
          email,
          password,
        ),
      );

      // if (result.value?.token != null) {
      //   _saveToken(result.value!.token);
      // }

      return result;
    } catch (e) {
      debugPrint(e.toString());
      return Result.failed(e);
    }
  }

  @override
  Future<Result<RegisterResult>> loginUser(String email, String password) async {
    try {
      return Result.succeed(
        await _authClient.loginUser(
          email,
          password,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
      return Result.failed(e);
    }
  }

  // Future<void> _saveToken(String token) async => _preferences.setString(_tokenKey, token);

  // @override
  // String? get token => _preferences.getString(_tokenKey);
}
