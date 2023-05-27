// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter_farmer_app/profile/domain/models/user.dart';

RegisterResult RegisterResultFromJson(String str) => RegisterResult.fromJson(json.decode(str));

String RegisterResultToJson(RegisterResult data) => json.encode(data.toJson());

class RegisterResult {
  User user;
  String token;

  RegisterResult({
    required this.user,
    required this.token,
  });

  factory RegisterResult.fromJson(Map<String, dynamic> json) => RegisterResult(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}
