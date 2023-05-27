import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_farmer_app/cart/domain/models/cart.dart';

class CartClient {
  CartClient(
    this._dio,
  );

  final Dio _dio;

  Future<void> doOrder(
    Cart cart,
  ) async =>
      await _dio.post(
        'api/basket',
        data: jsonEncode(cart),
      );
}
