import 'package:flutter/material.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:flutter_farmer_app/cart/domain/states/cart_state.dart';
import 'package:flutter_farmer_app/colors.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    required this.name,
    required this.productId,
    required this.price,
    super.key,
  });

  final String name;

  final double price;

  final int productId;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late final CartState cartState;

  void _decrementItem(CartItem item) async {
    await cartState.decrementItemFromCart(
      cartState.cart.cartItem.indexOf(item),
    );
    setState(
      () {},
    );
  }

  void _incrementItem(CartItem item) => setState(
        () {
          cartState.incrementItemToCart(
            cartState.cart.cartItem.indexOf(item),
          );
        },
      );

  void _addToCart() => setState(() {
        cartState.addToCart(widget.name, widget.productId, widget.price);
      });

  Widget _buildOrderButton(BuildContext context) => SizedBox(
        height: 45,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: ElevatedButton(
            onPressed: _addToCart,
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(greenColor),
            ),
            child: const Text('Заказать'),
          ),
        ),
      );

  Widget _buildQuantityButtons(BuildContext context) {
    final item = cartState.cart.cartItem.firstWhere((e) => e.productId == widget.productId);

    return Row(
      children: [
        IconButton(
          splashRadius: 25,
          icon: const Icon(LineIcons.minus),
          onPressed: () => _decrementItem(item),
        ),
        const Spacer(),
        Text(
          item.quantity.toString(),
        ),
        const Spacer(),
        IconButton(
          splashRadius: 25,
          icon: const Icon(LineIcons.plus),
          onPressed: () => _incrementItem(item),
        ),
      ],
    );
  }

  @override
  void initState() {
    cartState = context.read<CartState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(
                "assets/png/zlak.png",
                width: 70,
                height: 70,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.name,
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${widget.price.toInt()} ₽',
                        style: const TextStyle(
                          color: Colors.green,
                        ),
                      ),
                      const TextSpan(text: " / 1кг"),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('5'),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      LineIcons.starAlt,
                      color: Colors.amber,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Observer(
              builder: (_) => cartState.cart.findItemIndexFromCart(widget.productId) != null ? _buildQuantityButtons(context) : _buildOrderButton(context),
            ),
          ],
        ),
      );
}
