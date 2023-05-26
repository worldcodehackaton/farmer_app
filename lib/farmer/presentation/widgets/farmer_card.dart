import 'package:flutter/material.dart';

class FarmerCard extends StatelessWidget {
  const FarmerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Card(
          color: Colors.white,
          elevation: 3,
          child: InkWell(
            onTap: () {},
            child: Column(
              children: const [
                Text('farmer_name'),
                SizedBox(height: 12),
                Text('farmer_name'),
                Text('farmer_name'),
              ],
            ),
          ),
        ),
      );
}
