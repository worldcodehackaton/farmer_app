// ignore_for_file: library_private_types_in_public_api, prefer_final_fields

import 'package:flutter_farmer_app/profile/data/repositories/auth_repository.dart';
import 'package:flutter_farmer_app/profile/domain/models/user.dart';
import 'package:mobx/mobx.dart';

part 'auth_state.g.dart';

class AuthState = _AuthStateBase with _$AuthState;

abstract class _AuthStateBase with Store {
  _AuthStateBase(
    this._authRepository,
  );

  final AuthRepository _authRepository;

  @observable
  bool _isLoading = false;

  @observable
  bool _isFailed = false;

  @observable
  User? _user;

  @computed
  bool get isLoading => _isLoading;

  @computed
  bool get isFailed => _isFailed;

  // String? get token => _authRepository.token;

  // bool get hasToken => _authRepository.token != null;

  @computed
  User? get user => _user;

  @action
  Future<void> registerUser(
    String name,
    String email,
    String password,
  ) async {
    _isLoading = true;
    _isFailed = false;

    final result = await _authRepository.registerUser(
      name,
      email,
      password,
    );

    _isFailed = !result.succeed;
    _isLoading = false;

    if (!isFailed) {
      _user = result.value!.user;
    }
  }

  @action
  Future<void> loginUser(String email, String password) async {
    _isLoading = true;
    _isFailed = false;

    final result = await _authRepository.loginUser(email, password);

    _isFailed = !result.succeed;
    _isLoading = false;

    if (!isFailed) {
      _user = result.value!.user;
    }
  }
}
