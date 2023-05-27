import 'package:flutter_farmer_app/addresses/data/repositories/addresses_repository.dart';
import 'package:flutter_farmer_app/cart/data/client/cart_client.dart';
import 'package:flutter_farmer_app/cart/data/repositories/cart_repository.dart';
import 'package:flutter_farmer_app/cart/data/repositories/impl/cart_repository_impl.dart';
import 'package:flutter_farmer_app/common/dio.dart';
import 'package:flutter_farmer_app/addresses/data/repositories/impl/addresses_repository_impl.dart';
import 'package:flutter_farmer_app/farmer/data/client/farmer_client.dart';
import 'package:flutter_farmer_app/farmer/data/repositories/farmer_repository.dart';
import 'package:flutter_farmer_app/farmer/data/repositories/impl/farmer_repository_impl.dart';
import 'package:flutter_farmer_app/profile/data/client/auth_client.dart';
import 'package:flutter_farmer_app/profile/data/repositories/auth_repository.dart';
import 'package:flutter_farmer_app/profile/data/repositories/impl/auth_repository_impl.dart';
import 'package:get_it/get_it.dart';

Future<void> setupDependencies() async {
  setupDioDependency();
  await createClients();
  await createRepositories();
}

Future<void> createRepositories() async {
  // final sharedPreferces = await SharedPreferences.getInstance();

  GetIt.instance.registerLazySingleton<AddressesRepository>(
    () => AddressesRepositoryImpl(),
  );
  GetIt.instance.registerLazySingleton<FarmerRepository>(
    () => FarmerRepositoryImpl(
      GetIt.instance.get(),
    ),
  );
  GetIt.instance.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      GetIt.instance.get(),
      // sharedPreferces,
    ),
  );
  GetIt.instance.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(
      GetIt.instance.get(),
    ),
  );
}

Future<void> createClients() async {
  GetIt.instance.registerLazySingleton(
    () => FarmerClient(
      GetIt.instance.get(),
    ),
  );
  GetIt.instance.registerLazySingleton(
    () => AuthClient(
      GetIt.instance.get(),
    ),
  );
  GetIt.instance.registerLazySingleton(
    () => CartClient(
      GetIt.instance.get(),
    ),
  );
}
