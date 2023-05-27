import 'package:flutter/material.dart';
import 'package:flutter_farmer_app/map/domain/states/map_state.dart';
import 'package:line_icons/line_icons.dart';
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
    return Provider(
      create: (_) => MapState(),
      child: _MapPage(
        mapHeight: mapHeight,
      ),
    );
  }
}

class _MapPage extends StatelessWidget {
  _MapPage({required this.mapHeight});

  final double mapHeight;

  final _mapMarker = PlacemarkMapObject(
    mapId: const MapObjectId('_'),
    point: centerGroznyCoords,
    icon: PlacemarkIcon.single(
      PlacemarkIconStyle(
        scale: 10,
        image: BitmapDescriptor.fromAssetImage(
          LineIcons.mapMarker.toString(),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final mapState = context.read<MapState>();

    return Container(
      height: mapHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: YandexMap(
        mapObjects: [
          _mapMarker,
        ],
        onMapCreated: (controller) => mapState.onMapCreated(
          controller: controller,
          currentZoom: 10,
        ),
      ),
    );
  }
}
