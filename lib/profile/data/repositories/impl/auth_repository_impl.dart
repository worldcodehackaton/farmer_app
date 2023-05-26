import 'package:flutter/material.dart';

import '../../client/auth_client.dart';
import '../auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._authClient,
  );

  final AuthClient _authClient;

  @override
  Future<void> registerUser(String email, String password) async {
    try {
      await _authClient.registerUser(email, password);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> loginUser(String email, String password) async {
    try {
      await _authClient.loginUser(email, password);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
