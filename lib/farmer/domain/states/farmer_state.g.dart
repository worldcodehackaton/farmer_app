// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmer_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FarmerState on _FarmerStateBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_FarmerStateBase.isLoading'))
          .value;
  Computed<bool>? _$isFailedComputed;

  @override
  bool get isFailed =>
      (_$isFailedComputed ??= Computed<bool>(() => super.isFailed,
              name: '_FarmerStateBase.isFailed'))
          .value;
  Computed<ObservableList<Product>>? _$farmerProductsComputed;

  @override
  ObservableList<Product> get farmerProducts => (_$farmerProductsComputed ??=
          Computed<ObservableList<Product>>(() => super.farmerProducts,
              name: '_FarmerStateBase.farmerProducts'))
      .value;

  late final _$_isLoadingAtom =
      Atom(name: '_FarmerStateBase._isLoading', context: context);

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
      Atom(name: '_FarmerStateBase._isFailed', context: context);

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

  late final _$_farmerProductsAtom =
      Atom(name: '_FarmerStateBase._farmerProducts', context: context);

  @override
  ObservableList<Product> get _farmerProducts {
    _$_farmerProductsAtom.reportRead();
    return super._farmerProducts;
  }

  @override
  set _farmerProducts(ObservableList<Product> value) {
    _$_farmerProductsAtom.reportWrite(value, super._farmerProducts, () {
      super._farmerProducts = value;
    });
  }

  late final _$fetchFarmerProducsAsyncAction =
      AsyncAction('_FarmerStateBase.fetchFarmerProducs', context: context);

  @override
  Future<void> fetchFarmerProducs() {
    return _$fetchFarmerProducsAsyncAction
        .run(() => super.fetchFarmerProducs());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isFailed: ${isFailed},
farmerProducts: ${farmerProducts}
    ''';
  }
}
