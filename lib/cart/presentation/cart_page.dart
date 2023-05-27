// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:flutter_farmer_app/cart/domain/models/cart.dart';
import 'package:flutter_farmer_app/cart/domain/states/cart_state.dart';
import 'package:flutter_farmer_app/colors.dart';
import 'package:flutter_farmer_app/farmer/domain/states/farmer_state.dart';
import 'package:flutter_farmer_app/profile/domain/states/auth_state.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late final CartState _cartState;
  late final AuthState _authState;
  late final FarmerState _farmerState;

  void _decrementItem(CartItem item) {
    setState(
      () {
        _cartState.decrementItemFromCart(
          _cartState.cart.cartItem.indexOf(item),
        );
      },
    );
  }

  Future<void> _doOrder() async {
    final baskets = <Basket>[];

    for (var i = 0; i < _cartState.cart.cartItem.length; i++) {
      final cartItem = _cartState.cart.cartItem[i];
      final product = _farmerState.farmerProducts.firstWhere((e) => e.id == cartItem.productId);

      baskets.add(
        Basket(
          storeId: product.storeId,
          clientId: _authState.user!.id,
          productId: cartItem.productId,
          count: _cartState.cart.cartItem.length,
        ),
      );
    }

    await _cartState.doOrder(
      Cart(
        basket: baskets,
      ),
    );

    setState(() {});
  }

  Widget _buildOrderButton() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SizedBox(
          height: 45,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ElevatedButton(
              onPressed: _authState.user?.id != null ? _doOrder : null,
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(greenColor),
              ),
              child: const Text('Заказать'),
            ),
          ),
        ),
      );

  @override
  void initState() {
    _cartState = context.read<CartState>();
    _authState = context.read<AuthState>();
    _farmerState = context.read<FarmerState>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => _cartState.cart.cartItem.isEmpty
            ? const Center(
                child: Text('Корзина пока пуста'),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: _CartList(
                        _decrementItem,
                      ),
                    ),
                  ),
                  const Divider(height: 4, color: Colors.black),
                  _CartTotal(),
                  const SizedBox(height: 12),
                  _buildOrderButton(),
                  const SizedBox(height: 120),
                ],
              ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  const _CartList(
    this.decrementItemFromCart,
  );

  final Function(CartItem item) decrementItemFromCart;

  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;
    var cartProvider = context.watch<CartState>();

    return ListView.builder(
      itemCount: cartProvider.cart.cartItem.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () => decrementItemFromCart(cartProvider.cart.cartItem[index]),
        ),
        title: Text(
          cartProvider.cart.cartItem[index].productName.toString(),
          style: itemNameStyle,
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartState>(
              builder: (context, cart, child) => Row(
                children: [
                  const Text(
                    'Итого: ',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${cart.getTotalAmount().toInt().toString()} ₽',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}
