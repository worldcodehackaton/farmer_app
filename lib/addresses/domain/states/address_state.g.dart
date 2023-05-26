// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddressesState on _AddressesStateBase, Store {
  Computed<List<AddressModel>>? _$addressesComputed;

  @override
  List<AddressModel> get addresses => (_$addressesComputed ??=
          Computed<List<AddressModel>>(() => super.addresses,
              name: '_AddressesStateBase.addresses'))
      .value;
  Computed<AddressModel?>? _$selectedAddressComputed;

  @override
  AddressModel? get selectedAddress => (_$selectedAddressComputed ??=
          Computed<AddressModel?>(() => super.selectedAddress,
              name: '_AddressesStateBase.selectedAddress'))
      .value;

  late final _$_allAddressesAtom =
      Atom(name: '_AddressesStateBase._allAddresses', context: context);

  @override
  ObservableList<AddressModel> get _allAddresses {
    _$_allAddressesAtom.reportRead();
    return super._allAddresses;
  }

  @override
  set _allAddresses(ObservableList<AddressModel> value) {
    _$_allAddressesAtom.reportWrite(value, super._allAddresses, () {
      super._allAddresses = value;
    });
  }

  late final _$_selectedAddressAtom =
      Atom(name: '_AddressesStateBase._selectedAddress', context: context);

  @override
  AddressModel? get _selectedAddress {
    _$_selectedAddressAtom.reportRead();
    return super._selectedAddress;
  }

  @override
  set _selectedAddress(AddressModel? value) {
    _$_selectedAddressAtom.reportWrite(value, super._selectedAddress, () {
      super._selectedAddress = value;
    });
  }

  late final _$_AddressesStateBaseActionController =
      ActionController(name: '_AddressesStateBase', context: context);

  @override
  Future<void> addNewAddress(AddressModel address) {
    final _$actionInfo = _$_AddressesStateBaseActionController.startAction(
        name: '_AddressesStateBase.addNewAddress');
    try {
      return super.addNewAddress(address);
    } finally {
      _$_AddressesStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> editAddress(AddressModel address) {
    final _$actionInfo = _$_AddressesStateBaseActionController.startAction(
        name: '_AddressesStateBase.editAddress');
    try {
      return super.editAddress(address);
    } finally {
      _$_AddressesStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> deleteAddress(int addressId) {
    final _$actionInfo = _$_AddressesStateBaseActionController.startAction(
        name: '_AddressesStateBase.deleteAddress');
    try {
      return super.deleteAddress(addressId);
    } finally {
      _$_AddressesStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
addresses: ${addresses},
selectedAddress: ${selectedAddress}
    ''';
  }
}
