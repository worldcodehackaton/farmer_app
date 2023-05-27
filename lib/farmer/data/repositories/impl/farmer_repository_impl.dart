import 'package:flutter/material.dart';
import 'package:flutter_farmer_app/common/result.dart';
import 'package:flutter_farmer_app/farmer/data/client/farmer_client.dart';
import 'package:flutter_farmer_app/farmer/domain/models/product.dart';

import '../farmer_repository.dart';

class FarmerRepositoryImpl implements FarmerRepository {
  FarmerRepositoryImpl(
    this._client,
  );

  final FarmerClient _client;

  @override
  Future<Result> fetchFarmers() async {
    try {
      return Result<void>.succeed(
        await _client.fetchFarmers(),
      );
    } catch (e) {
      debugPrint(e.toString());
      return Result.failed(e);
    }
  }

  @override
  Future<Result<List<Product>>> fetchFarmerProducs() async {
    try {
      final result = await _client.fetchFarmerProducs();
      return Result<List<Product>>.succeed(result);
    } catch (e) {
      debugPrint(e.toString());
      return Result.failed(e);
    }
  }
}
