// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_farmer_app/profile/data/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';

part 'auth_state.g.dart';

class AuthState = _AuthStateBase with _$AuthState;

abstract class _AuthStateBase with Store {
  _AuthStateBase(
    this._authRepository,
  );

  final AuthRepository _authRepository;

  @action
  Future<void> registerUser(String email, String password) async => _authRepository.registerUser(email, password);

  @action
  Future<void> loginUser(String email, String password) async => _authRepository.loginUser(email, password);
}
