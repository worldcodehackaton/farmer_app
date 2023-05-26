// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapState on _MapStateBase, Store {
  Computed<YandexMapController?>? _$yandexMapControllerComputed;

  @override
  YandexMapController? get yandexMapController =>
      (_$yandexMapControllerComputed ??= Computed<YandexMapController?>(
              () => super.yandexMapController,
              name: '_MapStateBase.yandexMapController'))
          .value;

  late final _$_yandexMapControllerAtom =
      Atom(name: '_MapStateBase._yandexMapController', context: context);

  @override
  YandexMapController? get _yandexMapController {
    _$_yandexMapControllerAtom.reportRead();
    return super._yandexMapController;
  }

  @override
  set _yandexMapController(YandexMapController? value) {
    _$_yandexMapControllerAtom.reportWrite(value, super._yandexMapController,
        () {
      super._yandexMapController = value;
    });
  }

  late final _$onMapCreatedAsyncAction =
      AsyncAction('_MapStateBase.onMapCreated', context: context);

  @override
  Future<void> onMapCreated(
      {required YandexMapController controller,
      double currentZoom = 7,
      Point? point}) {
    return _$onMapCreatedAsyncAction.run(() => super.onMapCreated(
        controller: controller, currentZoom: currentZoom, point: point));
  }

  @override
  String toString() {
    return '''
yandexMapController: ${yandexMapController}
    ''';
  }
}
