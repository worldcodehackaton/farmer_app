import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

const _connectionTimeout = Duration(seconds: 15);
const _receiveTimeout = Duration(seconds: 14);

const host = '';

void setupDioDependency() {
  GetIt.instance.registerSingleton(
    createBaseClient(),
  );
}

Dio createBaseClient() {
  final dio = Dio();
  dio.options = _buildBaseOptions(host);

  return dio;
}

BaseOptions _buildBaseOptions(String host) {
  final options = BaseOptions(
    baseUrl: host,
    followRedirects: true,
    receiveTimeout: _receiveTimeout,
    connectTimeout: _connectionTimeout,
  );

  return options;
}

void acceptBadCertificate() {
  HttpOverrides.global = _BadCertificateHttpOverrides();
}

class _BadCertificateHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) => super.createHttpClient(context)..badCertificateCallback = (_, __, ___) => true;
}
