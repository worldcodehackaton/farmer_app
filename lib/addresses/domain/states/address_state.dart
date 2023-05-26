
// ignore_for_file: prefer_final_fields, library_private_types_in_public_api

import 'package:flutter_farmer_app/addresses/data/repositories/addresses_repository.dart';
import 'package:flutter_farmer_app/addresses/domain/models/address.dart';
import 'package:mobx/mobx.dart';

part 'address_state.g.dart';

class AddressesState = _AddressesStateBase with _$AddressesState;

abstract class _AddressesStateBase with Store {
  _AddressesStateBase(
    this._addressesRepository,
  );

  final AddressesRepository _addressesRepository;

  @observable
  var _allAddresses = ObservableList<AddressModel>();

  @observable
  AddressModel? _selectedAddress;

  @computed
  List<AddressModel> get addresses => _allAddresses;

  @computed
  AddressModel? get selectedAddress => _selectedAddress;

  @action
  Future<void> addNewAddress(AddressModel address) => _addressesRepository.addNewAddress();

  @action
  Future<void> editAddress(AddressModel address) => _addressesRepository.editAddress(address);

  @action
  Future<void> deleteAddress(int addressId) => _addressesRepository.deleteAddress(addressId);
}
