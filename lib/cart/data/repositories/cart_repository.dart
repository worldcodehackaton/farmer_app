import 'package:flutter_farmer_app/cart/domain/models/cart.dart';
import 'package:flutter_farmer_app/common/result.dart';

abstract class CartRepository {
  Future<EmptyResult> doOrder(
    Cart cart,
  );
}
