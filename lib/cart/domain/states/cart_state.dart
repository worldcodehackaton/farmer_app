// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_farmer_app/cart/domain/models/cart.dart';
import 'package:mobx/mobx.dart';

part 'cart_state.g.dart';

class CartState = _CartStateBase with _$CartState;

abstract class _CartStateBase with Store {
  _CartStateBase();

  @observable
  Cart? _cart;

  @computed
  Cart? get cart => _cart;
}
