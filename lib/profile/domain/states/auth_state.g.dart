// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthState on _AuthStateBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_AuthStateBase.isLoading'))
          .value;
  Computed<bool>? _$isFailedComputed;

  @override
  bool get isFailed => (_$isFailedComputed ??=
          Computed<bool>(() => super.isFailed, name: '_AuthStateBase.isFailed'))
      .value;
  Computed<User?>? _$userComputed;

  @override
  User? get user => (_$userComputed ??=
          Computed<User?>(() => super.user, name: '_AuthStateBase.user'))
      .value;

  late final _$_isLoadingAtom =
      Atom(name: '_AuthStateBase._isLoading', context: context);

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_isFailedAtom =
      Atom(name: '_AuthStateBase._isFailed', context: context);

  @override
  bool get _isFailed {
    _$_isFailedAtom.reportRead();
    return super._isFailed;
  }

  @override
  set _isFailed(bool value) {
    _$_isFailedAtom.reportWrite(value, super._isFailed, () {
      super._isFailed = value;
    });
  }

  late final _$_userAtom = Atom(name: '_AuthStateBase._user', context: context);

  @override
  User? get _user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  set _user(User? value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
    });
  }

  late final _$registerUserAsyncAction =
      AsyncAction('_AuthStateBase.registerUser', context: context);

  @override
  Future<void> registerUser(String name, String email, String password) {
    return _$registerUserAsyncAction
        .run(() => super.registerUser(name, email, password));
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
isLoading: ${isLoading},
isFailed: ${isFailed},
user: ${user}
    ''';
  }
}
