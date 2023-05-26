// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthState on _AuthStateBase, Store {
  late final _$registerUserAsyncAction =
      AsyncAction('_AuthStateBase.registerUser', context: context);

  @override
  Future<void> registerUser(String email, String password) {
    return _$registerUserAsyncAction
        .run(() => super.registerUser(email, password));
  }

  late final _$loginUserAsyncAction =
      AsyncAction('_AuthStateBase.loginUser', context: context);

  @override
  Future<void> loginUser(String email, String password) {
    return _$loginUserAsyncAction.run(() => super.loginUser(email, password));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
