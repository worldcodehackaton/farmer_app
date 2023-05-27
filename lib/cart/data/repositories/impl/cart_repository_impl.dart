import 'package:flutter/material.dart';
import 'package:flutter_farmer_app/cart/data/client/cart_client.dart';
import 'package:flutter_farmer_app/cart/data/repositories/cart_repository.dart';
import 'package:flutter_farmer_app/cart/domain/models/cart.dart';
import 'package:flutter_farmer_app/common/result.dart';

class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl(
    this._cartClient,
  );

  final CartClient _cartClient;

  @override
  Future<EmptyResult> doOrder(
    Cart cart,
  ) async {
    try {
      return EmptyResult.succeed(
        await _cartClient.doOrder(cart),
      );
    } catch (e) {
      debugPrint(e.toString());
      return EmptyResult.failed(e);
    }
  }
}
