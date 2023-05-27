import 'package:flutter_farmer_app/common/result.dart';
import 'package:flutter_farmer_app/profile/domain/models/register_result.dart';

abstract class AuthRepository {
  Future<Result<RegisterResult?>> registerUser(
    String name,
    String email,
    String password,
  );

  Future<Result<RegisterResult>> loginUser(
    String email,
    String password,
  );

  // String? get token;
}
