import 'package:flutter_farmer_app/common/result.dart';
import 'package:flutter_farmer_app/farmer/domain/models/product.dart';

abstract class FarmerRepository {
  Future<void> fetchFarmers();

  Future<Result<List<Product>>> fetchFarmerProducs();
}
