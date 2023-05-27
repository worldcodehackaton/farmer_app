import 'package:flutter/material.dart';
import 'package:flutter_farmer_app/colors.dart';
import 'package:flutter_farmer_app/farmer/domain/states/farmer_state.dart';
import 'package:flutter_farmer_app/farmer/presentation/farmer_page.dart';
import 'package:flutter_farmer_app/farmer/presentation/widgets/product_card.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({
    super.key,
  });

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  late final FarmerState _farmerState;

  PreferredSizeWidget _buildAppBar() => AppBar(
        title: const Text(
          'Каталог продуктов',
        ),
        backgroundColor: greenColor,
      );

  Widget _buildFarmers() => GridView.builder(
        padding: const EdgeInsets.only(top: 12),
        itemCount: _farmerState.farmerProducts.length,
        itemBuilder: (_, index) {
          final product = _farmerState.farmerProducts[index];

          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const FarmerPage(),
              ),
            ),
            borderRadius: BorderRadius.circular(20),
            child: ProductCard(
              name: product.name,
              price: product.price,
              productId: product.id,
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      );

  @override
  void initState() {
    _farmerState = context.read<FarmerState>()..fetchFarmerProducs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Observer(
        builder: (_) => _buildFarmers(),
      ),
    );
  }
}
