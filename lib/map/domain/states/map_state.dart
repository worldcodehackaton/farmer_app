// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'map_state.g.dart';

const _slowAnimation = MapAnimation(
  type: MapAnimationType.smooth,
  duration: 2,
);

const _fastAnimation = MapAnimation(
  type: MapAnimationType.smooth,
  duration: 0.5,
);

const _centerGroznyCoords = Point(
  latitude: 43.312,
  longitude: 45.6889,
);

class MapState = _MapStateBase with _$MapState;

abstract class _MapStateBase with Store {
  _MapStateBase();

  @observable
  YandexMapController? _yandexMapController;

  @computed
  YandexMapController? get yandexMapController => _yandexMapController;

  @action
  Future<void> onMapCreated({
    required YandexMapController controller,
    double currentZoom = 7,
    Point? point,
  }) async {
    try {
      _yandexMapController = controller;
      // await _state.yandexMapController!.toggleUserLayer(visible: true);
      _centerOn(
        animation: _slowAnimation,
        position: CameraPosition(
          zoom: currentZoom,
          target: Point(
            latitude: point?.latitude ?? _centerGroznyCoords.latitude,
            longitude: point?.longitude ?? _centerGroznyCoords.longitude,
          ),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _centerOn({
    required CameraPosition position,
    MapAnimation animation = _fastAnimation,
  }) =>
      _animateCamera(
        animation: animation,
        cameraUpdate: CameraUpdate.newCameraPosition(
          position,
        ),
      );

  Future<void> _animateCamera({
    required CameraUpdate cameraUpdate,
    MapAnimation animation = _fastAnimation,
  }) async {
    if (_yandexMapController == null) {
      return;
    }

    await yandexMapController!.moveCamera(
      cameraUpdate,
      animation: animation,
    );
  }
}
