import 'package:flutter/material.dart';
import 'package:flutter_farmer_app/map/domain/states/map_state.dart';
import 'package:provider/provider.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapPage extends StatelessWidget {
  const MapPage({
    this.mapHeight = 200,
    super.key,
  });

  final double mapHeight;

  @override
  Widget build(BuildContext context) {
    final mapState = context.read<MapState>();

    return Container(
      height: mapHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: YandexMap(
        onMapCreated: (controller) => mapState.onMapCreated(
          controller: controller,
          currentZoom: 10,
        ),
      ),
    );
  }
}
