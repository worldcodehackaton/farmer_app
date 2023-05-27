import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_farmer_app/addresses/domain/states/address_state.dart';
import 'package:flutter_farmer_app/cart/domain/states/cart_state.dart';
import 'package:flutter_farmer_app/common/dependencies.dart';
import 'package:flutter_farmer_app/farmer/domain/states/farmer_state.dart';
import 'package:flutter_farmer_app/map/domain/states/map_state.dart';
import 'package:flutter_farmer_app/profile/domain/states/auth_state.dart';
import 'package:flutter_farmer_app/root/presentation/root_page.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        title: 'Flutter Demo',
        home: MultiProvider(
          providers: [
            Provider<AddressesState>(
              create: (_) => AddressesState(
                GetIt.instance.get(),
              ),
            ),
            Provider<AuthState>(
              create: (_) => AuthState(
                GetIt.instance.get(),
              ),
            ),
            Provider<FarmerState>(
              create: (_) => FarmerState(
                GetIt.instance.get(),
              ),
            ),
            Provider<CartState>(
              create: (_) => CartState(
                FlutterCart(),
                GetIt.instance.get(),
              ),
            ),
          ],
          child: const RootPage(),
        ),
      );
}
