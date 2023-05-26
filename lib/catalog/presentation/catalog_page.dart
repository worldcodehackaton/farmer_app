import 'package:flutter/material.dart';
import 'package:flutter_farmer_app/colors.dart';
import 'package:flutter_farmer_app/farmer/presentation/widgets/farmer_card.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({
    super.key,
  });

  PreferredSizeWidget _buildAppBar() => AppBar(
        title: const Text(
          'Каталог фермеров',
        ),
        backgroundColor: greenColor,
      );

  Widget _buildFarmers() => GridView.builder(
        itemCount: 5,
        padding: const EdgeInsets.only(top: 12),
        itemBuilder: (_, __) => const FarmerCard(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildFarmers(),
    );
  }
}
