// ignore_for_file: library_private_types_in_public_api, prefer_final_fields

import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_farmer_app/cart/data/repositories/cart_repository.dart';
import 'package:flutter_farmer_app/cart/domain/models/cart.dart';
import 'package:mobx/mobx.dart';

part 'cart_state.g.dart';

class CartState = _CartStateBase with _$CartState;

abstract class _CartStateBase with Store {
  _CartStateBase(
    this._cart,
    this._cartRepository,
  );

  final CartRepository _cartRepository;

  @observable
  FlutterCart _cart;

  @computed
  FlutterCart get cart => _cart;

  @action
  Future<void> addToCart(
    String productName,
    int productId,
    double unitPrice,
  ) async =>
      _cart.addToCart(
        productName: productName,
        productId: productId,
        unitPrice: unitPrice,
      );

  @action
  Future<void> incrementItemToCart(int index) async => _cart.incrementItemToCart(index);

  @action
  Future<void> decrementItemFromCart(int index) async => _cart.decrementItemFromCart(index);

  @action
  Future<void> getCartItemCount() async => _cart.getCartItemCount();

  @action
  double getTotalAmount() => _cart.getTotalAmount();

  @action
  Future<void> doOrder(
    Cart cart,
  ) async {
    final result = await _cartRepository.doOrder(cart);

    if (result.succeed) {
      _cart.deleteAllCart();
    }
  }
}
