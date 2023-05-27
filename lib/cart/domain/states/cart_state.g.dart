// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartState on _CartStateBase, Store {
  Computed<FlutterCart>? _$cartComputed;

  @override
  FlutterCart get cart => (_$cartComputed ??=
          Computed<FlutterCart>(() => super.cart, name: '_CartStateBase.cart'))
      .value;

  late final _$_cartAtom = Atom(name: '_CartStateBase._cart', context: context);

  @override
  FlutterCart get _cart {
    _$_cartAtom.reportRead();
    return super._cart;
  }

  @override
  set _cart(FlutterCart value) {
    _$_cartAtom.reportWrite(value, super._cart, () {
      super._cart = value;
    });
  }

  late final _$addToCartAsyncAction =
      AsyncAction('_CartStateBase.addToCart', context: context);

  @override
  Future<void> addToCart(String productName, int productId, double unitPrice) {
    return _$addToCartAsyncAction
        .run(() => super.addToCart(productName, productId, unitPrice));
  }

  late final _$incrementItemToCartAsyncAction =
      AsyncAction('_CartStateBase.incrementItemToCart', context: context);

  @override
  Future<void> incrementItemToCart(int index) {
    return _$incrementItemToCartAsyncAction
        .run(() => super.incrementItemToCart(index));
  }

  late final _$decrementItemFromCartAsyncAction =
      AsyncAction('_CartStateBase.decrementItemFromCart', context: context);

  @override
  Future<void> decrementItemFromCart(int index) {
    return _$decrementItemFromCartAsyncAction
        .run(() => super.decrementItemFromCart(index));
  }

  late final _$getCartItemCountAsyncAction =
      AsyncAction('_CartStateBase.getCartItemCount', context: context);

  @override
  Future<void> getCartItemCount() {
    return _$getCartItemCountAsyncAction.run(() => super.getCartItemCount());
  }

  late final _$_CartStateBaseActionController =
      ActionController(name: '_CartStateBase', context: context);

  @override
  double getTotalAmount() {
    final _$actionInfo = _$_CartStateBaseActionController.startAction(
        name: '_CartStateBase.getTotalAmount');
    try {
      return super.getTotalAmount();
    } finally {
      _$_CartStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> doOrder(Cart cart) {
    final _$actionInfo = _$_CartStateBaseActionController.startAction(
        name: '_CartStateBase.doOrder');
    try {
      return super.doOrder(cart);
    } finally {
      _$_CartStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cart: ${cart}
    ''';
  }
}
