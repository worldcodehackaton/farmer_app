// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartState on _CartStateBase, Store {
  Computed<Cart?>? _$cartComputed;

  @override
  Cart? get cart => (_$cartComputed ??=
          Computed<Cart?>(() => super.cart, name: '_CartStateBase.cart'))
      .value;

  late final _$_cartAtom = Atom(name: '_CartStateBase._cart', context: context);

  @override
  Cart? get _cart {
    _$_cartAtom.reportRead();
    return super._cart;
  }

  @override
  set _cart(Cart? value) {
    _$_cartAtom.reportWrite(value, super._cart, () {
      super._cart = value;
    });
  }

  @override
  String toString() {
    return '''
cart: ${cart}
    ''';
  }
}
