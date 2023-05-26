import 'package:flutter_farmer_app/addresses/domain/models/address.dart';

abstract class AddressesRepository {
  Future<void> addNewAddress();

  Future<void> editAddress(AddressModel address);

  Future<void> deleteAddress(int id);
}
