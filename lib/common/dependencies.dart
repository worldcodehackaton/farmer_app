import 'package:flutter_farmer_app/common/dio.dart';
import 'package:flutter_farmer_app/addresses/data/repositories/impl/addresses_repository_impl.dart';
import 'package:flutter_farmer_app/farmer/data/client/farmer_client.dart';
import 'package:flutter_farmer_app/farmer/data/repositories/impl/farmer_repository_impl.dart';
import 'package:get_it/get_it.dart';

Future<void> setupDependencies() async {
  setupDioDependency();
  await createRepositories();
}

Future<void> createRepositories() async {
  GetIt.instance.registerSingleton(
    AddressesRepositoryImpl(),
  );
  GetIt.instance.registerSingleton(
    FarmerRepositoryImpl(),
  );
}

Future<void> createClients() async {
  GetIt.instance.registerSingleton(
    FarmerClient(
      GetIt.instance.get(),
    ),
  );
  GetIt.instance.registerSingleton(
    FarmerRepositoryImpl(),
  );
}
