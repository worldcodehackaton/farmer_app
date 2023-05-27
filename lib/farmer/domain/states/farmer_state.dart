// ignore_for_file: library_private_types_in_public_api, prefer_final_fields

import 'package:flutter_farmer_app/farmer/data/repositories/farmer_repository.dart';
import 'package:flutter_farmer_app/farmer/domain/models/product.dart';
import 'package:mobx/mobx.dart';

part 'farmer_state.g.dart';

class FarmerState = _FarmerStateBase with _$FarmerState;

abstract class _FarmerStateBase with Store {
  _FarmerStateBase(
    this._farmerRepository,
  );

  final FarmerRepository _farmerRepository;

  @observable
  bool _isLoading = false;

  @observable
  bool _isFailed = false;

  @observable
  ObservableList<Product> _farmerProducts = ObservableList();

  @computed
  bool get isLoading => _isLoading;

  @computed
  bool get isFailed => _isFailed;

  @computed
  ObservableList<Product> get farmerProducts => _farmerProducts;

  @action
  Future<void> fetchFarmerProducs() async {
    _isFailed = false;
    _isLoading = true;

    final result = await _farmerRepository.fetchFarmerProducs();

    if (result.value != null && result.succeed) {
      _farmerProducts
        ..clear()
        ..addAll(result.value!);
    }

    _isFailed = !result.succeed;
    _isLoading = false;
  }
}
