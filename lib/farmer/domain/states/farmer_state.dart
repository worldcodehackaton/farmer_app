// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'farmer_state.g.dart';

class FarmerState = _FarmerStateBase with _$FarmerState;

abstract class _FarmerStateBase with Store {
  _FarmerStateBase();
}
